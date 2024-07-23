{
    # Clean >= 30 day old generations every week
    nix.gc = {
        automatic = true;
        options = "--delete-older-than 7d";
        interval = [{ Hour = 3; Minute = 0; Weekday = 7; }];
    };
}
