import nodemailer from 'nodemailer';
import Logger from './logging.js';

const author = 'Underverse Battles';
const host = 'stmp.gmail.com';
const port = 465;
const secure = true;

const user = process.env.MAIL_USER;
const pass = process.env.MAIL_PASS;

const transporter = nodemailer.createTransport({
  host,
  port,
  secure,
  auth: {
    user,
    pass,
  }
});

export const send = async (receiver: string, title: string, message: string, html: string): Promise<void> => {
  return await transporter.sendMail({
    from: `"${author}" <${user}>`,
    to: receiver,
    subject: title,
    text: message,
    html,
  }, (error) => {
    Logger.warn(`Mail send failed, reason: ${error.message}`);
  });
}
