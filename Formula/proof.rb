class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260824044258"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824044258/proof_0.1.0-main.20260824044258_darwin_arm64.tar.gz"
      sha256 "cb190c553d5d97ceaad9b6522a94b56f9f038909622a96b380dd0a95a99dfe13"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824044258/proof_0.1.0-main.20260824044258_darwin_amd64.tar.gz"
      sha256 "4ee2a794635bebbece052b860805fa478e7a0be0feb37d5866f22b8be8843bb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824044258/proof_0.1.0-main.20260824044258_linux_arm64.tar.gz"
      sha256 "a90d7d2868ca9799b05cbfe000d433067aac81c1a48d3d970f93891fd17ae023"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260824044258/proof_0.1.0-main.20260824044258_linux_amd64.tar.gz"
      sha256 "6a7a3ae3acb980ae450e3c491a03a4ec9fa6b59ba21e556cd54cbca79eb9120a"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260824044258", output
  end
end
