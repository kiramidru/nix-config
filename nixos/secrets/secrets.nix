let
  kira = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEOmlgN+9HbPVXxkvsurd0S7FhQAQa4IqvOjQfZQlpqV kira@monolith";
  monolith = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKp37uW8PTr0zj/YZEXckBcT3ljqwDxj5iw4DfuDl91I root@kira";
in
{
  "github-token.age".publicKeys = [
    kira
    monolith
  ];
}
