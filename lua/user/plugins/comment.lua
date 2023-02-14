local status_ok_comment, comment = pcall(require, "Comment")
if not status_ok_comment then
  return
end

comment.setup {
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    local status_ok_utils, utils = pcall(require, "ts_context_commentstring.utils")
    if not status_ok_utils then
      return
    end

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = utils.get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = utils.get_visual_start_location()
    end

    local status_ok_internals, internals = pcall(require, "ts_context_commentstring.internals")
    if not status_ok_internals then
      return
    end

    return internals.calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}
