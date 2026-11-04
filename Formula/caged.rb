class Caged < Formula
  desc "Run coding agents in isolated containers"
  homepage "https://github.com/JeremyOrr4/caged"
  url "https://github.com/JeremyOrr4/caged/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "eec1148f3c2114fb655b578e252e15efeb9c461fb8296b330e127729bf2bf310"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/caged"
  end

  test do
    assert_match "caged version #{version}", shell_output("#{bin}/caged --version")
  end
end
