class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260427180601"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427180601/proof_0.1.0-main.20260427180601_darwin_arm64.tar.gz"
      sha256 "21df47f1937612ed86496fc2cc3a211edd92be0a673b288c5ebfec7cf9976def"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427180601/proof_0.1.0-main.20260427180601_darwin_amd64.tar.gz"
      sha256 "9d1a8f8075bb27f0d7a81491cf050de41589b0021cdb12192b73e4635ef5e1cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427180601/proof_0.1.0-main.20260427180601_linux_arm64.tar.gz"
      sha256 "144449bcf48f4cfcc7b72ea6d63f78333c6941ed5200691f0e2a107145befd1c"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260427180601/proof_0.1.0-main.20260427180601_linux_amd64.tar.gz"
      sha256 "14b09697f0b087c9db5e94bd97d4dd54b011b7fd4cb68dba09aaffcaf8e024fc"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260427180601", output
  end
end
