class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260804141625"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804141625/proof_0.1.0-main.20260804141625_darwin_arm64.tar.gz"
      sha256 "90024602a69b2cda7971cf90740a11adb673a6d0c034ba88ab7f806c24b80d78"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804141625/proof_0.1.0-main.20260804141625_darwin_amd64.tar.gz"
      sha256 "76a000d5452c9f02f893459777aa9b2903d119f45a31b6d0b52297810693992b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804141625/proof_0.1.0-main.20260804141625_linux_arm64.tar.gz"
      sha256 "3b04dfb5e54a922db468cc4e5b546c118a1317816e7b74c880dbb8c122f4e7c6"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260804141625/proof_0.1.0-main.20260804141625_linux_amd64.tar.gz"
      sha256 "e13637e3373da8c7eeb2e94b2921ae90ad9f7e3955fe16d53a827f83441eeaa9"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260804141625", output
  end
end
