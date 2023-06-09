import nodemailer from 'nodemailer';
import Logger from './logging.js';

const author = 'Underverse Battles';
const host = 'smtp.gmail.com';
const port = 465;
const secure = true;

const user = 'team.tornado.technologies@gmail.com';
const pass = 'ifpedlpgcugkmecw';

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
