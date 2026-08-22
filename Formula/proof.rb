class Proof < Formula
  desc "ReqProof CLI for requirements, traceability, and formal verification"
  homepage "https://github.com/probelabs/reqproof"
  version "0.1.0-main.20260822042956"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822042956/proof_0.1.0-main.20260822042956_darwin_arm64.tar.gz"
      sha256 "b6c9a8bb31a4d9941c01731dc46274529ee4d67850d6ea39c68a2839ff044190"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822042956/proof_0.1.0-main.20260822042956_darwin_amd64.tar.gz"
      sha256 "b180adacf741c9f01e5510c3f7cb18783b74126d1a4dff4fc985b4b45a5c252a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.intel?
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822042956/proof_0.1.0-main.20260822042956_linux_arm64.tar.gz"
      sha256 "71d1919a174f3a685686949b5a8d41a044e43c425c583104699c332fb3c357f6"
    else
      url "https://downloads.reqproof.com/releases/0.1.0-main.20260822042956/proof_0.1.0-main.20260822042956_linux_amd64.tar.gz"
      sha256 "e342111a559c0feb7deb7646b9dddcbeabda0853a0c43edbf97eb10cb09698e6"
    end
  end

  def install
    bin.install "proof"
  end

  test do
    output = shell_output("\#{bin}/proof version")
    assert_match "proof", output
    assert_match "0.1.0-main.20260822042956", output
  end
end
