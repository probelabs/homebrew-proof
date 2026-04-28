class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260428073041"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260428073041/proof_0.1.0-main.20260428073041_darwin_arm64.tar.gz"
      sha256 "b755cb8e8db8db64e7ed4c35b465f801719b246177a228308bad0ff823528036"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260428073041/proof_0.1.0-main.20260428073041_darwin_amd64.tar.gz"
      sha256 "42c5c8e77c8829e030d4cc209ffa7209ff89caf1fbb361fae1ec41b3edf7701a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260428073041/proof_0.1.0-main.20260428073041_linux_arm64.tar.gz"
      sha256 "b50938d41b204c89820117550e9e5256ea174c91d7a94340b487b5e398c9db1c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260428073041/proof_0.1.0-main.20260428073041_linux_amd64.tar.gz"
      sha256 "38938364ac04ca016f904dc30ccecbeca8e1710ef30b575c0337825257112c70"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260428073041", output
  end
end
