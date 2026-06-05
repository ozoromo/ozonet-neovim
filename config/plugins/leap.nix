{...}: {
  plugins.leap = {
    enable = true;
  };

  # nixvim removed leap's `addDefaultMappings` option, and leap's own
  # `add_default_mappings()` is stale in this version: it maps s/S to the
  # renamed `<Plug>(leap-*-to)` keys that the plugin no longer defines, so the
  # keys silently did nothing. Map them explicitly to the `<Plug>` targets this
  # version provides — the "Sneak-style" arrangement from `:help leap-mappings`.
  # (`<Plug>` keys are always expanded, so a non-recursive map is fine here.)
  extraConfigLua = ''
    vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)', { desc = 'Leap forward' })
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)', { desc = 'Leap backward' })
    vim.keymap.set({ 'n' }, 'gs', '<Plug>(leap-from-window)', { desc = 'Leap from window' })
  '';
}
