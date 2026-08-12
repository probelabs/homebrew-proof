class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260812194651"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812194651/proof_0.1.0-main.20260812194651_darwin_arm64.tar.gz"
      sha256 "49c7b4b3768748dd765c619180f26fdd1e0659703c7479e79a201dcb423fb28b"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812194651/proof_0.1.0-main.20260812194651_darwin_amd64.tar.gz"
      sha256 "c57d7ff6eb2f5a3591ba5d554797848bef042a4cb94469d77aebcac60c2ef3dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812194651/proof_0.1.0-main.20260812194651_linux_arm64.tar.gz"
      sha256 "9356387286753837a191387d970e1d6a16ecbf5aaf9b888647ec9e7c6973847e"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260812194651/proof_0.1.0-main.20260812194651_linux_amd64.tar.gz"
      sha256 "d81ae7e9e4ccbcb7e76b9adca516ddbf728d84979d9ee4b386a08d9c160a9ed6"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260812194651", output
  end
end
