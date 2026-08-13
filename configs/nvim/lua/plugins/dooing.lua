return {
    "atiladefreitas/dooing",
    config = function()
        require("dooing").setup({
            window = {
                width = 120,
                height = 30,
                border = 'double',
            },
            due_notifications = {
                enabled = false,
            }
        })
    end,
}
