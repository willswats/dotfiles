local status_ok_mkdnflow, mkdnflow = pcall(require, "mkdnflow")
if not status_ok_mkdnflow then
  return
end

mkdnflow.setup({
    to_do = {
        symbols = { ' ', 'x' },
        update_parents = true,
        not_started = ' ',
        in_progress = ' ',
        complete = 'x'
    },
})
