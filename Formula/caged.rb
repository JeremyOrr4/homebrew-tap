class Caged < Formula
  desc "Run coding agents in isolated containers"
  homepage "https://github.com/JeremyOrr4/caged"
  url "https://github.com/JeremyOrr4/caged/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "dc5807edaa5f83ff1299e3c63de5a0e5a7ed19f203d24c914f490644270d5049"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/caged"
  end

  test do
    assert_match "caged version #{version}", shell_output("#{bin}/caged --version")
  end
end
