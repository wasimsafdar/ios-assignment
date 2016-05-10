# iOS Assignment

Fork this repository to answer the assignment.

## Description

We would like to see your interpretation of an applcation's login flow.

The user starts on a screen that has a 'login' button in the navigation bar. When tapped, a username/password request is shown. 

Invalid email/pass combos should be handled and the user gracefully informed of their error (email must contain an '@' with characters on either side, and password must be ≥6 characters). 

You should mock a server to handle the submission of the credentials. For this assignment assume that everyone with an `@shopgun` email address has an account, and that their passwords are the same as the local part of their email.

On successful authentication return to the original screen, and now provide a logout button.

You are free to improvise with all aspects of the design/UX of this login flow, as long as the user can login with an email/pass combo, have it authenticated by a server, and then logout again once successful.

## Requirements

- Use obj-c

## Bonus Points

- Forgot password prompt.
- Create user prompt.
- Simulate occasional slow/bad server responses.
- Persist login state (we would be receiving a token response from the server on success).
- Documentation.
- Unit tests.

Have fun!
