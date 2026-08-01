class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260801171854"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260801171854/proof_0.1.0-main.20260801171854_darwin_arm64.tar.gz"
      sha256 "ef9dd8bd18bf94f44663693b65f5709efecfa858c4c9cb66c44f82d4636afe1c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260801171854/proof_0.1.0-main.20260801171854_darwin_amd64.tar.gz"
      sha256 "f42a10ff29eed675c6fac07f8839108cbb3f291298fb538da1fd6a21e38ad17a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260801171854/proof_0.1.0-main.20260801171854_linux_arm64.tar.gz"
      sha256 "ca5d530e20331ab4314b6d704912a4cbd913b0c4162075e8efe59d46bee51396"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260801171854/proof_0.1.0-main.20260801171854_linux_amd64.tar.gz"
      sha256 "27187224c600e90fca58d50c8d33adb28ae3d881e4f40271a3b24fa04218b95e"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260801171854", output
  end
end
