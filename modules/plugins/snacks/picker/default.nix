{self, ...}: {
  flake.nixosModules.snacks-picker = {
    config,
    lib,
    pkgs,
    ...
  }: let
    lua = self.lib.lua;
    picker = "Snacks.picker";
  in {
    vim.utility.snacks-nvim.setupOpts.picker = {
      enable =
        true;
    };

    vim.keymaps = [
      # General
      {
        key = "<leader><space>";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Smart Find Files";
        action = lua.mkLuaGlobalCmd "Snacks.picker.smart";
      }
      {
        key = "<leader>,";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Buffers";
        action = lua.mkLuaGlobalCmd "Snacks.picker.buffers";
      }
      {
        key = "<leader>/";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Grep";
        action = lua.mkLuaGlobalCmd "Snacks.picker.grep";
      }
      {
        key = "<leader>:";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Command History";
        action = lua.mkLuaGlobalCmd "Snacks.picker.command_history";
      }
      {
        key = "<leader>n";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Notification History";
        action = lua.mkLuaGlobalCmd "Snacks.picker.notifications";
      }
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "File Explorer";
        action = lua.mkLuaGlobalCmd "Snacks.explorer";
      }

      # find
      {
        key = "<leader>fb";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Buffers";
        action = lua.mkLuaGlobalCmd "Snacks.picker.buffers";
      }
      {
        key = "<leader>fc";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Find Config File";
        action = lua.mkLuaGlobalArgs "Snacks.picker.files" ["{ cwd = vim.fn.stdpath('config') }"];
      }
      {
        key = "<leader>ff";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Find Files";
        action = lua.mkLuaGlobalCmd "Snacks.picker.files";
      }
      {
        key = "<leader>fg";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Find Git Files";
        action = lua.mkLuaGlobalCmd "Snacks.picker.git_files";
      }
      {
        key = "<leader>fp";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Projects";
        action = lua.mkLuaGlobalCmd "Snacks.picker.projects";
      }
      {
        key = "<leader>fr";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Recent";
        action = lua.mkLuaGlobalCmd "Snacks.picker.recent";
      }

      # git
      {
        key = "<leader>gb";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Git Branches";
        action = lua.mkLuaGlobalCmd "Snacks.picker.git_branches";
      }
      {
        key = "<leader>gl";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Git Log";
        action = lua.mkLuaGlobalCmd "Snacks.picker.git_log";
      }
      {
        key = "<leader>gL";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Git Log Line";
        action = lua.mkLuaGlobalCmd "Snacks.picker.git_log_line";
      }
      {
        key = "<leader>gs";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Git Status";
        action = lua.mkLuaGlobalCmd "Snacks.picker.git_status";
      }
      {
        key = "<leader>gS";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Git Stash";
        action = lua.mkLuaGlobalCmd "Snacks.picker.git_stash";
      }
      {
        key = "<leader>gd";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Git Diff (Hunks)";
        action = lua.mkLuaGlobalCmd "Snacks.picker.git_diff";
      }
      {
        key = "<leader>gf";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Git Log File";
        action = lua.mkLuaGlobalCmd "Snacks.picker.git_log_file";
      }

      # gh
      {
        key = "<leader>gi";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "GitHub Issues (open)";
        action = lua.mkLuaGlobalCmd "Snacks.picker.gh_issue";
      }
      {
        key = "<leader>gI";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "GitHub Issues (all)";
        action = lua.mkLuaGlobalArgs "Snacks.picker.gh_issue" ["{ state = 'all' }"];
      }
      {
        key = "<leader>gp";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "GitHub Pull Requests (open)";
        action = lua.mkLuaGlobalCmd "Snacks.picker.gh_pr";
      }
      {
        key = "<leader>gP";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "GitHub Pull Requests (all)";
        action = lua.mkLuaGlobalArgs "Snacks.picker.gh_pr" ["{ state = 'all' }"];
      }

      # Grep
      {
        key = "<leader>sb";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Buffer Lines";
        action = lua.mkLuaGlobalCmd "Snacks.picker.lines";
      }
      {
        key = "<leader>sB";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Grep Open Buffers";
        action = lua.mkLuaGlobalCmd "Snacks.picker.grep_buffers";
      }
      {
        key = "<leader>sg";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Grep";
        action = lua.mkLuaGlobalCmd "Snacks.picker.grep";
      }
      {
        key = "<leader>sw";
        mode = ["n" "x"];
        silent = true;
        noremap = true;
        desc = "Visual selection or word";
        action = lua.mkLuaGlobalCmd "Snacks.picker.grep_word";
      }

      # search
      {
        key = ''<leader>s"'';
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Registers";
        action = lua.mkLuaGlobalCmd "Snacks.picker.registers";
      }
      {
        key = "<leader>s/";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Search History";
        action = lua.mkLuaGlobalCmd "Snacks.picker.search_history";
      }
      {
        key = "<leader>sa";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Autocmds";
        action = lua.mkLuaGlobalCmd "Snacks.picker.autocmds";
      }
      {
        key = "<leader>sb";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Buffer Lines";
        action = lua.mkLuaGlobalCmd "Snacks.picker.lines";
      }
      {
        key = "<leader>sc";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Command History";
        action = lua.mkLuaGlobalCmd "Snacks.picker.command_history";
      }
      {
        key = "<leader>sC";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Commands";
        action = lua.mkLuaGlobalCmd "Snacks.picker.commands";
      }
      {
        key = "<leader>sd";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Diagnostics";
        action = lua.mkLuaGlobalCmd "Snacks.picker.diagnostics";
      }
      {
        key = "<leader>sD";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Buffer Diagnostics";
        action = lua.mkLuaGlobalCmd "Snacks.picker.diagnostics_buffer";
      }
      {
        key = "<leader>sh";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Help Pages";
        action = lua.mkLuaGlobalCmd "Snacks.picker.help";
      }
      {
        key = "<leader>sH";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Highlights";
        action = lua.mkLuaGlobalCmd "Snacks.picker.highlights";
      }
      {
        key = "<leader>si";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Icons";
        action = lua.mkLuaGlobalCmd "Snacks.picker.icons";
      }
      {
        key = "<leader>sj";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Jumps";
        action = lua.mkLuaGlobalCmd "Snacks.picker.jumps";
      }
      {
        key = "<leader>sk";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Keymaps";
        action = lua.mkLuaGlobalCmd "Snacks.picker.keymaps";
      }
      {
        key = "<leader>sl";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Location List";
        action = lua.mkLuaGlobalCmd "Snacks.picker.loclist";
      }
      {
        key = "<leader>sm";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Marks";
        action = lua.mkLuaGlobalCmd "Snacks.picker.marks";
      }
      {
        key = "<leader>sM";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Man Pages";
        action = lua.mkLuaGlobalCmd "Snacks.picker.man";
      }
      {
        key = "<leader>sp";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Search for Plugin Spec";
        action = lua.mkLuaGlobalCmd "Snacks.picker.lazy";
      }
      {
        key = "<leader>sq";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Quickfix List";
        action = lua.mkLuaGlobalCmd "Snacks.picker.qflist";
      }
      {
        key = "<leader>sR";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Resume";
        action = lua.mkLuaGlobalCmd "Snacks.picker.resume";
      }
      {
        key = "<leader>su";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Undo History";
        action = lua.mkLuaGlobalCmd "Snacks.picker.undo";
      }
      {
        key = "<leader>uC";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Colorschemes";
        action = lua.mkLuaGlobalCmd "Snacks.picker.colorschemes";
      }

      # LSP
      {
        key = "gd";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Goto Definition";
        action = lua.mkLuaGlobalCmd "Snacks.picker.lsp_definitions";
      }
      {
        key = "gD";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Goto Declaration";
        action = lua.mkLuaGlobalCmd "Snacks.picker.lsp_declarations";
      }
      {
        key = "gr";
        mode = "n";
        silent = true;
        noremap = true;
        nowait = true;
        desc = "References";
        action = lua.mkLuaGlobalCmd "Snacks.picker.lsp_references";
      }
      {
        key = "gI";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Goto Implementation";
        action = lua.mkLuaGlobalCmd "Snacks.picker.lsp_implementations";
      }
      {
        key = "gy";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Goto T[y]pe Definition";
        action = lua.mkLuaGlobalCmd "Snacks.picker.lsp_type_definitions";
      }
      {
        key = "gai";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "C[a]lls Incoming";
        action = lua.mkLuaGlobalCmd "Snacks.picker.lsp_incoming_calls";
      }
      {
        key = "gao";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "C[a]lls Outgoing";
        action = lua.mkLuaGlobalCmd "Snacks.picker.lsp_outgoing_calls";
      }
      {
        key = "<leader>ss";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "LSP Symbols";
        action = lua.mkLuaGlobalCmd "Snacks.picker.lsp_symbols";
      }
      {
        key = "<leader>sS";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "LSP Workspace Symbols";
        action = lua.mkLuaGlobalCmd "Snacks.picker.lsp_workspace_symbols";
      }

      # Other
      {
        key = "<leader>z";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Toggle Zen Mode";
        action = lua.mkLuaGlobalCmd "Snacks.zen";
      }
      {
        key = "<leader>Z";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Toggle Zoom";
        action = lua.mkLuaGlobalCmd "Snacks.zen.zoom";
      }
      {
        key = "<leader>.";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Toggle Scratch Buffer";
        action = lua.mkLuaGlobalCmd "Snacks.scratch";
      }
      {
        key = "<leader>S";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Select Scratch Buffer";
        action = lua.mkLuaGlobalCmd "Snacks.scratch.select";
      }
      {
        key = "<leader>n";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Notification History";
        action = lua.mkLuaGlobalCmd "Snacks.notifier.show_history";
      }
      {
        key = "<leader>bd";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Delete Buffer";
        action = lua.mkLuaGlobalCmd "Snacks.bufdelete";
      }
      {
        key = "<leader>cR";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Rename File";
        action = lua.mkLuaGlobalCmd "Snacks.rename.rename_file";
      }
      {
        key = "<leader>gB";
        mode = ["n" "v"];
        silent = true;
        noremap = true;
        desc = "Git Browse";
        action = lua.mkLuaGlobalCmd "Snacks.gitbrowse";
      }
      {
        key = "<leader>gg";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Lazygit";
        action = lua.mkLuaGlobalCmd "Snacks.lazygit";
      }
      {
        key = "<leader>un";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Dismiss All Notifications";
        action = lua.mkLuaGlobalCmd "Snacks.notifier.hide";
      }
      {
        key = "<c-/>";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "Toggle Terminal";
        action = lua.mkLuaGlobalCmd "Snacks.terminal";
      }
      {
        key = "<c-_>";
        mode = "n";
        silent = true;
        noremap = true;
        desc = "which_key_ignore";
        action = lua.mkLuaGlobalCmd "Snacks.terminal";
      }
      {
        key = "]]";
        mode = ["n" "t"];
        silent = true;
        noremap = true;
        desc = "Next Reference";
        action = lua.mkLuaGlobalArgs "Snacks.words.jump" ["vim.v.count1"];
      }
      {
        key = "[[";
        mode = ["n" "t"];
        silent = true;
        noremap = true;
        desc = "Prev Reference";
        action = lua.mkLuaGlobalArgs "Snacks.words.jump" ["-vim.v.count1"];
      }
    ];
  };
}
