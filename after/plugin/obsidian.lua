local obsidian_vault_dir = os.getenv("OBSIDIAN_VAULT_DEFAULT_DIR")

if obsidian_vault_dir == nil then
    print("Could not read obs obsidian_vault_dir from ENV OBSIDIAN_VAULT_DEFAULT_DIR")
end

require("obsidian").setup({
    dir = obsidian_vault_dir,
    completion = {
        nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
    },
    daily_notes = {
        folder = "daily_notes",
    },
    templates = {
        subdir = "tablet-sync/templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M"
    },
    note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
            -- If title is given, return it
            return title
        else
            return "unnamed " .. tostring(os.time())
        end
    end
})

-- map ony for markdown
local mapx = require'mapx'
mapx.map("gd", ":ObsidianFollowLink<CR>",  "silent", { ft = "markdown", desc = "Follow obsidian link"})
mapx.map("<leader>fn", ":ObsidianNew<CR>",  "silent", { ft = "markdown", desc = "Create new obsidian note"})
mapx.map("gt", ":ObsidianTemplate<CR>",  "silent", { ft = "markdown", desc = "Obsidian create template"})
mapx.map("gr", ":ObsidianBacklinks<CR>",  "silent", { ft = "markdown", desc = "Obsidian list backlinks"})

mapx.vmap("K", ":ObsidianLinkNew<CR>",  "silent", { ft = "markdown", desc = "Link selection"})
mapx.nmap("K", "viwK",  "silent", { ft = "markdown", desc = "Link word under cursor"})

-- search for todos, closing bracket always broke the mapping
mapx.map("<leader>e", "/[<Space><CR>",  "silent", { ft = "markdown", desc = "Obsidian list backlinks"})
