Describe "Installer script for"
  Describe "git"
    It "should install with curl"
      When call bash -c "curl https://installer.to/git | bash"
      The output should include "git version"
    End
  End
End
