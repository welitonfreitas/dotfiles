

local get_header = require("notilew.core.utils.startpage-headers")
local datetime = tonumber(os.date(" %H "))
local header = get_header(0, true)

local function term_nav(dir)
    ---@param self snacks.terminal
    return function(self)
        return self:is_floating() and "<c-" .. dir .. ">" or vim.schedule(function()
            vim.cmd.wincmd(dir)
        end)
    end
end

local greeting = function()
    -- Determine the appropriate greeting based on the hour
    local mesg
    local username = os.getenv("USERNAME") or os.getenv("USER") or "Estranho"
    if datetime >= 0 and datetime < 6 then
        mesg = "Dreaming..󰒲 󰒲 "
    elseif datetime >= 6 and datetime < 12 then
        mesg = "🌅 Hi " .. username .. ", Good Morning ☀️"
    elseif datetime >= 12 and datetime < 18 then
        mesg = "🌞 Hi " .. username .. ", Good Afternoon ☕️"
    elseif datetime >= 18 and datetime < 21 then
        mesg = "🌆 Hi " .. username .. ", Good Evening 🌙"
    else
        mesg = "Hi " .. username .. ", it's getting late, get some sleep 😴"
    end
    return mesg
end

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = {
        "kevinhwang91/nvim-ufo"
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
        pattern = "OilActionsPost",
        callback = function(event)
            if event.data.actions.type == "move" then
            Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
            end
        end,
        })
    end,
    keys = {
        { "<leader>bd", function() Snacks.bufdelete() end,       desc = "Buffer delete",       mode = "n" },
        { "<leader>ba", function() Snacks.bufdelete.all() end,   desc = "Buffer delete all",   mode = "n" },
        { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Buffer delete other", mode = "n" },
        { "<leader>uz", function() Snacks.zen() end,             desc = "Toggle Zen Mode",     mode = "n" },
        { "<leader>wm", function() Snacks.toggle.zoom() end,             desc = "Toggle Zoom mode",     mode = "n" },
        { "<leader>uZ", function() Snacks.toggle.zoom() end,             desc = "Toggle zoom mode",     mode = "n" },
        
        -- Top Pickers & Explorer
        { "<leader><space>", function() Snacks.picker.git_files() end, desc = "Smart Find Files" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>fn", function() Snacks.picker.notifications() end, desc = "Notification History" },
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer " },
        { "<leader>E", function() Snacks.explorer() end, desc = "File Explorer cwd" },
        -- find
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fG", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
        { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
        -- Grep
        { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
        { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
        { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
        { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
        { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
        { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
        { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
        { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
        { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
        { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
        { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
        { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
        { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
        { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    },
    opts = {
        bigfile = { enabled = true },
        terminal = {
            win = {
                keys = {
                    nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
                    nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
                    nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
                    nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
                },
            },
        },
        dashboard = {
            preset = {
                pick = nil,
                ---@type snacks.dashboard.Item[]
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
                header = header,
            },
            sections = {
                { section = 'header' },
                {
                section = "keys",
                indent = 1,
                padding = 1,
                },
                { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                -- {
                --     pane = 2,
                --     icon = " ",
                --     title = "Git Status",
                --     section = "terminal",
                --     enabled = function()
                --         return Snacks.git.get_root() ~= nil
                --     end,
                --     cmd = "git status --short --branch --renames",
                --     height = 5,
                --     padding = 1,
                --     ttl = 5 * 60,
                --     indent = 3,
                -- },
                -- { section = "greeting" },
                -- { section = "footer" },
                { section = "session", padding = 1 },
                { align = "center", text = greeting(), padding = 1, },
                function()
                    local stats = require("lazy").stats()
                    local total_plugins = stats.count
                    local footer_datetime = os.date("  %m-%d-%Y   %H:%M:%S")
                    local version = vim.version()
                    local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    local value = footer_datetime .. "   Plugins " .. total_plugins .. nvim_version_info
                    return { align = "center", text = value, padding = 1, }
                end,
            },
        },
        explorer = { enabled = true },
        indent = { enabled = true,  only_scope = true, },
        input = { enabled = false },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        rename = { enabled = true },
        zen = {
            enabled = true,
            toggles = {
                ufo             = true,
                dim             = true,
                git_signs       = false,
                diagnostics     = false,
                line_number     = false,
                relative_number = false,
                signcolumn      = "no",
                indent          = false
            }
        },
    },
    config = function(_, opts)
        require("snacks").setup(opts)

        Snacks.toggle.new({
        id = "ufo",
        name = "Enable/Disable ufo",
        get = function()
            return require("ufo").inspect()
        end,
        set = function(state)
            if state == nil then
                require("noice").enable()
                require("ufo").enable()
                vim.o.foldenable = true
                vim.o.foldcolumn = "1"
            else
                require("noice").disable()
                require("ufo").disable()
                vim.o.foldenable = false
                vim.o.foldcolumn = "0"
            end
        end,
        })
    end
}