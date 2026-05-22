.class public Lcom/taomee/pwdlogin/data/LoginRecordsData;
.super Ljava/lang/Object;
.source "LoginRecordsData.java"


# instance fields
.field private context:Landroid/content/Context;

.field private db:Landroid/database/sqlite/SQLiteDatabase;

.field private sql:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->context:Landroid/content/Context;

    .line 13
    return-void
.end method


# virtual methods
.method public addLoginRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;
    .param p3, "isRemember"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/login.db"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 22
    const-string v0, "CREATE TABLE IF NOT EXISTS login_records ( id INTEGER PRIMARY KEY AUTOINCREMENT, userName, pwd, isRemember)"

    iput-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    .line 27
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 28
    const-string v0, "DELETE FROM login_records WHERE userName=?"

    iput-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    .line 29
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    new-array v2, v4, [Ljava/lang/String;

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 30
    const-string v0, "INSERT INTO login_records (userName,pwd,isRemember) VALUES (?,?,?)"

    iput-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    .line 31
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    aput-object p1, v2, v3

    aput-object p2, v2, v4

    const/4 v3, 0x2

    aput-object p3, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 32
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 33
    return-void
.end method

.method public deleteLoginRecord(Ljava/lang/String;)V
    .locals 4
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/login.db"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 56
    const-string v0, "CREATE TABLE IF NOT EXISTS login_records ( id INTEGER PRIMARY KEY AUTOINCREMENT, userName, pwd, isRemember)"

    iput-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    .line 61
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 62
    const-string v0, "DELETE FROM login_records WHERE userName=?"

    iput-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    .line 63
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 64
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 65
    return-void
.end method

.method public deleteLoginRecords()V
    .locals 2

    .prologue
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/login.db"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 72
    const-string v0, "CREATE TABLE IF NOT EXISTS login_records ( id INTEGER PRIMARY KEY AUTOINCREMENT, userName, pwd, isRemember)"

    iput-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    .line 77
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 78
    const-string v0, "DELETE FROM login_records"

    iput-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    .line 79
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 81
    return-void
.end method

.method public getAllLoginRecords()Landroid/database/Cursor;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/login.db"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iput-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 40
    const-string v1, "CREATE TABLE IF NOT EXISTS login_records ( id INTEGER PRIMARY KEY AUTOINCREMENT, userName, pwd, isRemember)"

    iput-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    .line 45
    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v2, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 46
    const-string v1, "SELECT * FROM login_records ORDER BY id DESC"

    iput-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    .line 47
    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v2, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 48
    .local v0, "cursor":Landroid/database/Cursor;
    return-object v0
.end method

.method public getDb()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method

.method public getRecentLoginRecord()Landroid/database/Cursor;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/login.db"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iput-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 88
    const-string v1, "CREATE TABLE IF NOT EXISTS login_records ( id INTEGER PRIMARY KEY AUTOINCREMENT, userName, pwd, isRemember)"

    iput-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    .line 93
    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v2, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 94
    const-string v1, "SELECT * FROM login_records ORDER BY id DESC LIMIT 1"

    iput-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    .line 95
    iget-object v1, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->db:Landroid/database/sqlite/SQLiteDatabase;

    iget-object v2, p0, Lcom/taomee/pwdlogin/data/LoginRecordsData;->sql:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 96
    .local v0, "cursor":Landroid/database/Cursor;
    return-object v0
.end method
