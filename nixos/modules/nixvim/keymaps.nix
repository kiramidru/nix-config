{
  programs.nixvim = {
    keymaps = [
      # --- General / Project View ---
      {
        mode = "n";
        key = "<leader>pv";
        action = "<cmd>Ex<CR>";
        options.desc = "Open Netrw (Project View)";
      }

      # --- System Clipboard (Yank) ---
      {
        mode = "v";
        key = "<leader>y";
        action = "\"+y";
        options.desc = "Yank selection to system clipboard";
      }
      {
        mode = "n";
        key = "<leader>y";
        action = "\"+y";
        options.desc = "Yank motion to system clipboard";
      }
      {
        mode = "n";
        key = "<leader>Y";
        action = "\"+yg_";
        options.desc = "Yank to end of line to system clipboard";
      }
      {
        mode = "n";
        key = "<leader>yy";
        action = "\"+yy";
        options.desc = "Yank current line to system clipboard";
      }

      # --- System Clipboard (Paste) ---
      {
        mode = "n";
        key = "<leader>p";
        action = "\"+p";
        options.desc = "Paste after cursor from clipboard";
      }
      {
        mode = "n";
        key = "<leader>P";
        action = "\"+P";
        options.desc = "Paste before cursor from clipboard";
      }
      {
        mode = "v";
        key = "<leader>p";
        action = "\"+p";
        options.desc = "Paste after selection from clipboard";
      }

      # --- Modern Quality of Life ---
      # Move selected lines up and down in Visual Mode
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options.desc = "Move selection down";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
        options.desc = "Move selection up";
      }

      # Clear search highlights on <Esc>
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>noh<CR>";
        options.desc = "Clear search highlights";
      }
    ];
  };
}
