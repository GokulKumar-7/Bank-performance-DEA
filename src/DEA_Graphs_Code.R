
# Load required libraries
library(ggplot2)
library(readxl)
library(dplyr)
library(tidyr)

# Sample data creation for plotting
banks <- c("Axis", "Bandhan", "BoB", "BoM", "Canara", "City Union", "Equitas", "HDFC", "ICICI", "IDBI",
           "IDFC First", "IndusInd", "Karur Vysya", "Kotak", "PNB", "South Indian", "SBI", "UCO", "Union", "Yes")

pre_eff <- c(0.947,1,0.975,1,1,1,1,1,1,0.867,1,1,0.965,1,1,1,1,1,0.970,1)
post_eff <- c(1,1,1,0.940,1,1,1,1,1,0.978,1,1,0.910,1,1,1,1,1,1,1)

eff_df <- data.frame(Bank = banks, Pre = pre_eff, Post = post_eff)

# --- Chart 1: Bar Plot for Pre vs. Post Efficiency ---
eff_long <- pivot_longer(eff_df, cols = c("Pre", "Post"), names_to = "Period", values_to = "Efficiency")

ggplot(eff_long, aes(x = Bank, y = Efficiency, fill = Period)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(title = "Pre vs Post Pandemic Efficiency Scores of Banks", x = "", y = "Efficiency Score") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# --- Chart 2: Line Plot for MPI Trends ---
mpi <- c(1.1154,0.9948,0.9940,0.9164,0.9911,0.6131,0.8495,0.9917,1.0757,0.5900,
         0.7987,0.7972,1.1295,0.8632,0.8638,1.0822,0.7105,1.0288,0.9404,0.5990)
mpi_df <- data.frame(Bank = banks, MPI = mpi)

ggplot(mpi_df, aes(x = Bank, y = MPI, group = 1)) +
  geom_line(color = "blue") +
  geom_point(color = "darkblue") +
  geom_hline(yintercept = 1, linetype = "dashed", color = "red") +
  theme_minimal() +
  labs(title = "Productivity Trends (MPI) Across Banks", x = "", y = "Malmquist Productivity Index") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# --- Chart 3: Stacked Bar (EC + TC) ---
ec <- c(1.2865,1.0636,1.0494,0.9992,1,1,0.8516,1.0382,1.2433,1,
        1.0056,0.9397,1.2542,0.8617,0.9863,1.1718,0.967,1,1.0754,0.9598)
tc <- c(0.867,0.9353,0.9472,0.9171,0.9911,0.6131,0.9975,0.9552,0.8652,0.5900,
        0.7943,0.8483,0.9006,1.0018,0.8759,0.9236,0.7347,1.0288,0.8745,0.6241)

prod_df <- data.frame(Bank = banks, EC = ec, TC = tc)

prod_df_long <- pivot_longer(prod_df, cols = c("EC", "TC"), names_to = "Component", values_to = "Value")

ggplot(prod_df_long, aes(x = Bank, y = Value, fill = Component)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Decomposition of Productivity (EC + TC) by Bank", y = "Total Productivity Components", x = "") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
