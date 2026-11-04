class Caged < Formula
  desc "Run coding agents in isolated containers"
  homepage "https://github.com/JeremyOrr4/caged"
  url "https://github.com/JeremyOrr4/caged/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "82e2966a7f074dcc2c1e426f7414e245d12348da462e2222e447432890aa0907"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/caged"
  end

  test do
    assert_match "caged version #{version}", shell_output("#{bin}/caged --version")
  end
end
