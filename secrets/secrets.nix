let
  # Machine/Host Key (from /etc/ssh/ssh_host_ed25519_key.pub)
  monolith = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKp37uW8PTr0zj/YZEXckBcT3ljqwDxj5iw4DfuDl91I root@kira";

  systems = [ monolith ];

  # Personal User Key (from ~/.ssh/id_ed25519.pub)
  kira = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGhN0w7XaJwQMbU9l8lV+Ti/gpHVpqZ9xcoUVrElLfZc kira@monolith";

  users = [ kira ];

in
{
  "kira-password.age".publicKeys = [
    monolith
    kira
  ];

  "github-token.age".publicKeys = users;
}
