return {
  {
    "andythigpen/nvim-coverage",
    keys = {
      { "<leader>tc", "<cmd>CoverageLoad<cr><cmd>CoverageToggle<cr>", desc = "Toggle code coverage" },
      { "<leader>tC", "<cmd>CoverageLoad<cr><cmd>CoverageSummary<cr>", desc = "Show code coverage summary" },
    },
    opts = {},
  },
}
