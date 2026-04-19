class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260419140603"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260419140603/proof_0.1.0-main.20260419140603_darwin_arm64.tar.gz"
      sha256 "fd5d9a28f6492b418a1baeb217f99ae1a99c11b1220239cf890c0806ff36cca3"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260419140603/proof_0.1.0-main.20260419140603_darwin_amd64.tar.gz"
      sha256 "d40e827b45227b664ecbedf1df0831dfb85f0bc8d257d695a1fd0415d5950539"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260419140603/proof_0.1.0-main.20260419140603_linux_arm64.tar.gz"
      sha256 "286a416a6564189c8fc695b795da61d80693ebadb9bd7bd3971fe8b65305144a"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260419140603/proof_0.1.0-main.20260419140603_linux_amd64.tar.gz"
      sha256 "e13db447ac439f68e9b616e9aaf5d10462063679d8ba0dac40b527992b0a89a2"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260419140603", output
  end
end
