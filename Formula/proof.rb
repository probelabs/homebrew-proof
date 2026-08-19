class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260819112836"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260819112836/proof_0.1.0-main.20260819112836_darwin_arm64.tar.gz"
      sha256 "5e20d750a326d99cadd44878dcd819ad130c303bc35d00dc20a7d51a27c34075"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260819112836/proof_0.1.0-main.20260819112836_darwin_amd64.tar.gz"
      sha256 "d84a358140c79a574d7f7b583996377023d675c1eb28ef2f61bdde2db3dff70c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260819112836/proof_0.1.0-main.20260819112836_linux_arm64.tar.gz"
      sha256 "ec77dce7646641d0c7d2bf05de32a10143352f10e129dd9fabb98940314741e2"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260819112836/proof_0.1.0-main.20260819112836_linux_amd64.tar.gz"
      sha256 "3cce254c49a42edb6d9081dbaaccd6ed0e9916c2f58d17e727bbc66665d48fad"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260819112836", output
  end
end
