class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260404054230"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-ccebb4aa45944de7a72edc403634a318.r2.dev/releases/0.1.0-main.20260404054230/proof_0.1.0-main.20260404054230_darwin_arm64.tar.gz"
      sha256 "9232ed03267f5d650adfa277dd7eef3bc125d62bd18679a3c814197b86f94824"
    else
      url "https://pub-ccebb4aa45944de7a72edc403634a318.r2.dev/releases/0.1.0-main.20260404054230/proof_0.1.0-main.20260404054230_darwin_amd64.tar.gz"
      sha256 "9374917abecfe239a7f00349cb6deb234f5efbac1f23729bc05b40c536dfb376"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://pub-ccebb4aa45944de7a72edc403634a318.r2.dev/releases/0.1.0-main.20260404054230/proof_0.1.0-main.20260404054230_linux_arm64.tar.gz"
      sha256 "a74778e0895259ffee23d22d11e6b61551d0f17d70f85b0634a3ff61ee5327f0"
    else
      url "https://pub-ccebb4aa45944de7a72edc403634a318.r2.dev/releases/0.1.0-main.20260404054230/proof_0.1.0-main.20260404054230_linux_amd64.tar.gz"
      sha256 "e63ddf1e8ef9c4281b4da2dee3958546655381124d39a9d19b79ea0ae76c1436"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260404054230", output
  end
end
