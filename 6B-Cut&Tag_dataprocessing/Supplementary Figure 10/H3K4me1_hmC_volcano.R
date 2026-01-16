# ---- Libraries ----
library(tidyverse)
library(ggrastr)
library(ggnewscale)

# ---- Read main data ----
df <- read.table(
  "H3K4Me1_all_DMCs.hmC.txt",
  header = TRUE, sep = "\t", fill = TRUE,
  stringsAsFactors = FALSE
) %>% as_tibble()

# ---- Define significance ----
df <- df %>% mutate(Sig = "No")
df[df$pvalue < 0.05 & df$meth.diff >  1.5, "Sig"] <- "Increased"
df[df$pvalue < 0.05 & df$meth.diff < -1.5, "Sig"] <- "Decreased"

# ---- Read label file ----
lab <- read.table(
  "H3K4Me1_all_DMCs.hmC.label",
  header = FALSE, sep = "",
  stringsAsFactors = FALSE
) %>%
  as_tibble() %>%
  setNames(c("chr", "pos", "group", "pt_color")) %>%
  mutate(
    chr = as.character(chr),
    pos = as.character(pos),
    group = as.character(group),
    .id = paste(chr, pos, sep = ":")
  )

# ---- Join key ----
df <- df %>%
  mutate(
    chr = as.character(chr),
    start = as.character(start),
    .id = paste(chr, start, sep = ":")
  )

hl <- df %>%
  inner_join(lab %>% select(.id, group), by = ".id")

# ---- Theme ----
theme_set(
  theme_classic(base_size = 20) +
    theme(
      axis.title.y = element_text(
        face = "bold",
        margin = margin(0, 20, 0, 0),
        size = rel(1.1),
        color = "black"
      ),
      axis.title.x = element_text(
        hjust = 0.5,
        face = "bold",
        margin = margin(20, 0, 0, 0),
        size = rel(1.1),
        color = "black"
      ),
      plot.title = element_text(hjust = 0.5)
    )
)

bg_size <- 0.5
hl_size <- bg_size + 3.5

# ---- Shape mapping (fillable shapes only: 21–25) ----
# Fixed shapes for specific labels
fixed_shapes <- c(
  "Igf2r"   = 21,
  "Kcnq1ot" = 22,
  "Peg3"    = 24
)

# Assign remaining shapes to any other groups
all_groups   <- sort(unique(hl$group))
other_groups <- setdiff(all_groups, names(fixed_shapes))
shape_pool   <- setdiff(21:25, unname(fixed_shapes))

other_shapes <- setNames(
  rep(shape_pool, length.out = length(other_groups)),
  other_groups
)

shape_map <- c(fixed_shapes, other_shapes)

# ---- Plot ----
p <- ggplot(df, aes(x = meth.diff, y = -log10(pvalue))) +
  geom_vline(xintercept = c(-0.6, 0.6), col = "grey", linetype = "dashed") +
  geom_hline(yintercept = -log10(0.05), col = "grey", linetype = "dashed") +

  # Background points (rasterized)
  ggrastr::geom_point_rast(
    aes(color = Sig),
    size = bg_size,
    alpha = 0.9
    #raster.dpi = 600
  ) +
  scale_color_manual(values = c(
    "Increased" = "limegreen",
    "Decreased" = "limegreen",
    "No"        = "grey"
  )) +

  ggnewscale::new_scale_color() +

  # Highlighted points: black outline, white fill
  geom_point(
    data = hl,
    aes(shape = group),
    size = hl_size,
    stroke = 0.9,
    color = "black",
    fill = "white"
  ) +
  scale_shape_manual(values = shape_map) +

  labs(
    x = expression("log"[2] * "FC"),
    y = expression("-log"[10] * "p-value")
  ) +
  theme(legend.position = "none") +
  ggtitle("H3K4Me1 vs WG hmC")

# ---- Save PDF ----
ggsave(
  "H3K4Me1_all_DMCs.hmC.pdf",
  plot = ggrastr::rasterise(p, dpi = 600),
  #plot = p,
  device = cairo_pdf,
  width = 7.5,
  height = 7,
  units = "in"
)

