const sgMail = require('@sendgrid/mail');

// This will be set in the Render environment variables
sgMail.setApiKey(process.env.SENDGRID_API_KEY);

console.log('SendGrid mailer configured.');
console.log(`SENDGRID_API_KEY loaded: ${process.env.SENDGRID_API_KEY ? 'Yes' : 'No'}`);

async function sendPasswordResetEmail(to, token) {
  const resetLink = `${process.env.FRONTEND_URL}/reset-password?token=${token}`;
  const msg = {
    to: to,
    from: 'bhageshbiradar820@gmail.com', // This must be a verified Sender Identity in SendGrid
    subject: 'Password Reset Request',
    text: `You are receiving this because you (or someone else) have requested the reset of the password for your account.\n\nPlease click on the following link, or paste this into your browser to complete the process:\n\n${resetLink}\n\nIf you did not request this, please ignore this email and your password will remain unchanged.\n`,
    html: `<p>You are receiving this because you (or someone else) have requested the reset of the password for your account.</p><p>Please click on the following link, or paste this into your browser to complete the process:</p><p><a href="${resetLink}">${resetLink}</a></p><p>If you did not request this, please ignore this email and your password will remain unchanged.</p>`,
  };

  await sgMail.send(msg);
  console.log('Password reset email sent to:', to);
}

async function sendVerificationEmail(to, token) {
  const verificationLink = `${process.env.FRONTEND_URL}/verify-email?token=${token}`;
  const msg = {
    to: to,
    from: 'bhageshbiradar820@gmail.com', // This must be a verified Sender Identity in SendGrid
    subject: 'Verify Your Email Address',
    text: `Welcome to Shree Medicare! Please verify your email address by clicking the following link:\n\n${verificationLink}\n\nIf you did not create an account, please ignore this email.`,
    html: `<p>Welcome to Shree Medicare!</p><p>Please verify your email address by clicking the following link:</p><p><a href="${verificationLink}">${verificationLink}</a></p><p>If you did not create an account, please ignore this email.</p>`,
  };

  await sgMail.send(msg);
  console.log('Verification email sent to:', to);
}

module.exports = { sendPasswordResetEmail, sendVerificationEmail };