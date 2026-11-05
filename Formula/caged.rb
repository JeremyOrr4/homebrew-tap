class Caged < Formula
  desc "Run coding agents in isolated containers"
  homepage "https://github.com/JeremyOrr4/caged"
  url "https://github.com/JeremyOrr4/caged/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "21a4bb2324a24eb4b913ba4bf28dba1ebd5d65c5a38ee5eab70926f5b965121b"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/caged"
  end

  test do
    assert_match "caged version #{version}", shell_output("#{bin}/caged --version")
  end
end
