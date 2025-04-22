local M = {}

M.defaults = {
  transparent = false,
  autoload    = false,
}

function M.setup(opts)
  opts = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})

  vim.g.lunaria_glow_transparent = opts.transparent and true or false

  if opts.autoload then
    local ok, err = pcall(vim.cmd, "colorscheme lunaria_glow")
    if not ok then
      vim.notify(
        "[lunaria_glow] colourscheme not found on runtimepath",
        vim.log.levels.WARN
      )
    end
  end

  return opts
end

return M