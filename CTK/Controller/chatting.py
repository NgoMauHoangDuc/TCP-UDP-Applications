import os
from tkinter import messagebox
from tkinter.filedialog import askdirectory

import requests

from CTK.Model.db import DB



class Chatting:
    def __init__(self,user_id):

        self.db = DB(host="localhost", user="root", password="", database="skype")
        self.user_id = user_id

#     def get_conversations(self):
#         query="""
#     SELECT c.conversation_id, c.name, c.is_group
# FROM conversations c
# JOIN conversation_participants cp ON c.conversation_id = cp.conversation_id
# WHERE cp.user_id = %s
#     """
#         value=self.db.fetch_query(query, (self.user_id,))
#         conversations_id=value['conversation_id']
#         query1 = """ Select user_id from conversations_participants where conversation_id = (%s)  """
#         value1=self.db.fetch_query(query1, (conversations_id,))
#         result=((value),(value1))
#         return result
    def get_conversations(self):
        query = """
        SELECT c.conversation_id, c.name, c.is_group
        FROM conversations c
        JOIN conversation_participants cp ON c.conversation_id = cp.conversation_id
        WHERE cp.user_id = %s
        """
        conversations = self.db.fetch_query(query, (self.user_id,))

        result = []
        for conversation in conversations:
            conversation_id = conversation['conversation_id']

            # Lấy tất cả các user_id tham gia cuộc trò chuyện này
            query1 = "SELECT user_id FROM conversation_participants WHERE conversation_id = %s"
            participants = self.db.fetch_query(query1, (conversation_id,))

            # Thêm thông tin cuộc trò chuyện và người tham gia vào kết quả
            result.append({
                'conversation': conversation,
                'participants': participants
            })
        print(result)
        return result

    def send_message(self,conversation_id,sender_id,message):
        query="""
        INSERT INTO messages (conversation_id, sender_id, message_text)
        VALUES (%s, %s, %s)
    """
        value=(conversation_id, sender_id, message)
        self.db.execute_query(query, value)

    def send_file(self, conversation_id, sender_id, file_path, file_name):
        # Lưu tin nhắn trước
        query_message = """
            INSERT INTO messages (conversation_id, sender_id, message_text)
            VALUES (%s, %s, %s)
        """
        values_message = (conversation_id, sender_id, f"Sent a file: {file_name}")
        self.db.execute_query(query_message, values_message)

        # Lấy ID tin nhắn vừa lưu
        message_id = self.db.cursor.lastrowid

        # Lưu file liên kết với tin nhắn
        query_file = """
            INSERT INTO files (message_id, file_path, file_name)
            VALUES (%s, %s, %s)
        """
        values_file = (message_id, file_path, file_name)
        self.db.execute_query(query_file, values_file)

        return message_id  # Trả về ID tin nhắn để hiển thị

    def get_message(self,conversation_id):
        query=""" Select message_id,sender_id, message_text from messages where conversation_id = %s ORDER BY sent_at  """
        messages = self.db.fetch_query(query, (conversation_id,))
        print(f"Cac tin nhan: {messages}")
        return messages
    def get_user_name(self,user_id):
        query=""" Select username from users where user_id = %s  """
        username = self.db.fetch_query(query, (user_id,))
        print(username)
        return username

    def upload_file(self,file_path):


        url = "http://localhost/server_token/file.php"
        with open(file_path, 'rb') as file:
            files = {'file': file}
            response = requests.post(url, files=files)

        print("Response:", response.text)

    def is_file_message(self,message_id):
        # Truy vấn kiểm tra file
        query = "SELECT * FROM files WHERE message_id = %s"
        file=self.db.fetch_query(query, (message_id,))

        # Nếu có file liên kết, trả về True
        if file:
            return file
        else:
            return False

    def download_file(self, message_text):
        # Lấy tên file từ tin nhắn
        file_name = message_text.split(": ")[1]
        file_url = f"http://localhost/server_token/FileClient/{file_name}"  # URL file trên server

        # Mở hộp thoại chọn thư mục lưu
        save_path = askdirectory(title="Select Download Folder")
        if save_path:
            # Đường dẫn lưu file vào máy người dùng
            save_file_path = os.path.join(save_path, file_name)

            try:
                # Tải file từ server
                response = requests.get(file_url, stream=True)

                # Kiểm tra nếu tải file thành công (HTTP status 200)
                if response.status_code == 200:
                    with open(save_file_path, 'wb') as f:
                        for chunk in response.iter_content(chunk_size=1024):
                            if chunk:
                                f.write(chunk)
                    messagebox.showinfo("Success", f"File downloaded to {save_file_path}")
                else:
                    messagebox.showerror("Error", f"Failed to download file: {response.status_code}")

            except Exception as e:
                messagebox.showerror("Error", f"Failed to download file: {e}")