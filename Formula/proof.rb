class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260822050954"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822050954/proof_0.1.0-main.20260822050954_darwin_arm64.tar.gz"
      sha256 "655ef5ee653d2672d203df2f41a2431d818d8bdf27ce52d55376bf3ac31e11ad"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822050954/proof_0.1.0-main.20260822050954_darwin_amd64.tar.gz"
      sha256 "25e0b6c26d0954080a8fa5cfc9cd40a20b1a226ab0f82d2964d9f46005133d8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822050954/proof_0.1.0-main.20260822050954_linux_arm64.tar.gz"
      sha256 "b94966246d76d33170dfa2079001ef6de98572c79c8fbb26798b215297a9952d"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822050954/proof_0.1.0-main.20260822050954_linux_amd64.tar.gz"
      sha256 "5be65049aba35376302f089114d6d85e308af0e745c00d5072d25a346a0cbe94"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260822050954", output
  end
end
