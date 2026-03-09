{ pkgs, ... }: {
  channel = "stable-23.11";

  packages = [
    pkgs.python311
    pkgs.git
  ];

  idx.workspace.onCreate = {
    phia-setup = ''
      python -m venv .venv
      . .venv/bin/activate
      python -m pip install --upgrade pip
      python -m pip install -r requirements.txt
      python -m pip install --no-deps git+https://github.com/google-deepmind/onetwo
      python -m pip install jupyterlab nbconvert openpyxl
    '';

    default.openFiles = [
      "README.md"
      "phia_demo.ipynb"
      ".idx/dev.nix"
    ];
  };
}
