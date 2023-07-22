# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
# library(tarchetypes) # Load other packages as needed. # nolint

# Set target options:
tar_option_set(
  packages = c("tidyverse",
               "furrr",
               "zoo",
               "see",
               "knitr",
               "kableExtra",
               "targets",
               "patchwork"), # packages that your targets need to run
  format = "rds" # default storage format
  # Set other options as needed.
)

# tar_make_clustermq() configuration (okay to leave alone):
options(clustermq.scheduler = "multicore")

# tar_make_future() configuration (okay to leave alone):
# Install packages {{future}}, {{future.callr}}, and {{future.batchtools}} to allow use_targets() to configure tar_make_future() options.

# Load the R scripts with your custom functions:
lapply(list.files("R", full.names = TRUE, recursive = TRUE), source)
# source("other_functions.R") # Source other scripts as needed. # nolint
source("~/Documents/GitHub/sp_development/r/sp_funs_equal_h_thr.R")

# Replace the target list below with your own:
list(
  tar_target(
    d1,
    "~/sp-data/paper0_au_validering/D1.b/" %>%
      sp_wrapper(
        acq_time = 120,
        sample_intake_rate = 0.346,
        RM_string = "60 nm Au 100 ng/l RM",
        RM_dia = 60,
        RM_isotope = "Au",
        RM_density = 19.32,
        element_fraction = 1,
        dens_comps = dens_comps
      )
  ),
  tar_target(
    d2,
    "~/sp-data/paper0_au_validering/D2.b/" %>%
      sp_wrapper(
        acq_time = 120,
        sample_intake_rate = 0.346,
        RM_string = "60 nm Au 100 ng/l RM",
        RM_dia = 60,
        RM_isotope = "Au",
        RM_density = 19.32,
        element_fraction = 1,
        dens_comps = dens_comps
      )
  ),
  tar_target(
    d3,
    "~/sp-data/paper0_au_validering/D3.b/" %>% sp_wrapper(
      acq_time = 120,
      sample_intake_rate = 0.346,
      RM_string = "60 nm Au 100 ng/l RM",
      RM_dia = 60,
      RM_isotope = "Au",
      RM_density = 19.32,
      element_fraction = 1,
      dens_comps = dens_comps
    )
  ),
  tar_target(
    d4,
    "~/sp-data/paper0_au_validering/D4.b/" %>% sp_wrapper(
      acq_time = 120,
      sample_intake_rate = 0.346,
      RM_string = "60 nm Au 100 ng/l RM",
      RM_dia = 60,
      RM_isotope = "Au",
      RM_density = 19.32,
      element_fraction = 1,
      dens_comps = dens_comps
    )
  ),
  tar_target(
    d5,
    "~/sp-data/paper0_au_validering/D5.b/" %>% sp_wrapper(
      acq_time = 120,
      sample_intake_rate = 0.346,
      RM_string = "60 nm Au 100 ng/l RM",
      RM_dia = 60,
      RM_isotope = "Au",
      RM_density = 19.32,
      element_fraction = 1,
      dens_comps = dens_comps
    )
  ),
  tar_target(
    au_alldays,
    bind_rows(
      tar_read(d1),
      tar_read(d2),
      tar_read(d3),
      tar_read(d4),
      tar_read(d5),
      .id = "day"
    )
  ),
  tar_target(
    poster1,
    sp_wrapper("~/OneDrive - Havforskningsinstituttet/Are Marine Nanoparticles/Paper_2_Au_val/poster_data/200814_BM_TiCuCr_x6000_poster_1.b/",
               acq_time = 180,
               sample_intake_rate = 0.346,
               RM_string = "Au RM",
               RM_dia = 63,
               RM_isotope = "Au",
               RM_density = 19.32,
               element_fraction = 1,
               dens_comps = dens_comps
    )
  ),
  tar_target(
    poster2,
    sp_wrapper("~/OneDrive - Havforskningsinstituttet/Are Marine Nanoparticles/Paper_2_Au_val/poster_data/200823_BM_TiCuCr_x6000_poster_2.b/",
               acq_time = 180,
               sample_intake_rate = 0.346,
               RM_string = "Au RM 150ng/L",
               RM_dia = 63,
               RM_isotope = "Au",
               RM_density = 19.32,
               element_fraction = 1,
               dens_comps = dens_comps
    )
  ),
  tar_target(
    au_sizes,
    sp_wrapper(
      csv_folder = "~/sp-data/190920_nye gullpartikler.b",
      acq_time = 120,
      sample_intake_rate = 0.346,
      RM_string = "^60 nm 100 ng/L",
      RM_dia = 63,
      RM_isotope = "Au",
      RM_density = 19.32,
      element_fraction = 1,
      dens_comps = dens_comps
    )
  )
)
