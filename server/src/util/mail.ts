import nodemailer from 'nodemailer';
import Logger from './logging.js';

const transporter = nodemailer.createTransport({
  host: 'smtp.gmail.com',
  port: 465,
  secure: true,
  auth: {
    user: 'underverse.battles@gmail.com',
    pass: 'gnlrmcousafnpwae'
  }
});

export const send = async (receiver: string, title: string, message: string, html: string): Promise<void> => {
  return await transporter.sendMail({
    from: '"Underverse Battles" <underverse.battles@gmail.com>',
    to: receiver,
    subject: title,
    text: message,
    html
  }, (error) => {
    Logger.info(`Mail send failed: ${error.message}`);
  });
};
