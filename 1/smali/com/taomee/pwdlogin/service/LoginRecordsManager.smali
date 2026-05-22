.class public Lcom/taomee/pwdlogin/service/LoginRecordsManager;
.super Ljava/lang/Object;
.source "LoginRecordsManager.java"


# instance fields
.field private loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Lcom/taomee/pwdlogin/data/LoginRecordsData;

    invoke-direct {v0, p1}, Lcom/taomee/pwdlogin/data/LoginRecordsData;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/taomee/pwdlogin/service/LoginRecordsManager;->loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

    .line 15
    return-void
.end method


# virtual methods
.method public addLoginRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "pwd"    # Ljava/lang/String;
    .param p3, "isRemember"    # Ljava/lang/String;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginRecordsManager;->loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

    invoke-virtual {v0, p1, p2, p3}, Lcom/taomee/pwdlogin/data/LoginRecordsData;->addLoginRecord(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    return-void
.end method

.method public deleteLoginRecord(Ljava/lang/String;)V
    .locals 1
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginRecordsManager;->loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

    invoke-virtual {v0, p1}, Lcom/taomee/pwdlogin/data/LoginRecordsData;->deleteLoginRecord(Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method public deleteLoginRecords()V
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/taomee/pwdlogin/service/LoginRecordsManager;->loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

    invoke-virtual {v0}, Lcom/taomee/pwdlogin/data/LoginRecordsData;->deleteLoginRecords()V

    .line 81
    return-void
.end method

.method public getAllLoginRecords()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/taomee/pwdlogin/service/LoginRecordObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 30
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/taomee/pwdlogin/service/LoginRecordObject;>;"
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginRecordsManager;->loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

    invoke-virtual {v4}, Lcom/taomee/pwdlogin/data/LoginRecordsData;->getAllLoginRecords()Landroid/database/Cursor;

    move-result-object v0

    .line 32
    .local v0, "cursor":Landroid/database/Cursor;
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-nez v4, :cond_1

    .line 39
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 40
    iget-object v4, p0, Lcom/taomee/pwdlogin/service/LoginRecordsManager;->loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

    invoke-virtual {v4}, Lcom/taomee/pwdlogin/data/LoginRecordsData;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 41
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 42
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 44
    :cond_0
    return-object v2

    .line 33
    .end local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :cond_1
    new-instance v3, Lcom/taomee/pwdlogin/service/LoginRecordObject;

    invoke-direct {v3}, Lcom/taomee/pwdlogin/service/LoginRecordObject;-><init>()V

    .line 34
    .local v3, "loginRecordObject":Lcom/taomee/pwdlogin/service/LoginRecordObject;
    const/4 v4, 0x1

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/taomee/pwdlogin/service/LoginRecordObject;->setUserName(Ljava/lang/String;)V

    .line 35
    const/4 v4, 0x2

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/taomee/pwdlogin/service/LoginRecordObject;->setPwd(Ljava/lang/String;)V

    .line 36
    const/4 v4, 0x3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/taomee/pwdlogin/service/LoginRecordObject;->setIsRemember(Ljava/lang/String;)V

    .line 37
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getRecentLoginRecord()Lcom/taomee/pwdlogin/service/LoginRecordObject;
    .locals 4

    .prologue
    .line 51
    const/4 v2, 0x0

    .line 52
    .local v2, "loginRecordObject":Lcom/taomee/pwdlogin/service/LoginRecordObject;
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/LoginRecordsManager;->loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

    invoke-virtual {v3}, Lcom/taomee/pwdlogin/data/LoginRecordsData;->getRecentLoginRecord()Landroid/database/Cursor;

    move-result-object v0

    .line 53
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-lez v3, :cond_0

    .line 54
    new-instance v2, Lcom/taomee/pwdlogin/service/LoginRecordObject;

    .end local v2    # "loginRecordObject":Lcom/taomee/pwdlogin/service/LoginRecordObject;
    invoke-direct {v2}, Lcom/taomee/pwdlogin/service/LoginRecordObject;-><init>()V

    .line 56
    .restart local v2    # "loginRecordObject":Lcom/taomee/pwdlogin/service/LoginRecordObject;
    :cond_0
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 61
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 62
    iget-object v3, p0, Lcom/taomee/pwdlogin/service/LoginRecordsManager;->loginRecordsData:Lcom/taomee/pwdlogin/data/LoginRecordsData;

    invoke-virtual {v3}, Lcom/taomee/pwdlogin/data/LoginRecordsData;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 63
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 64
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 66
    :cond_1
    return-object v2

    .line 57
    .end local v1    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :cond_2
    const/4 v3, 0x1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/taomee/pwdlogin/service/LoginRecordObject;->setUserName(Ljava/lang/String;)V

    .line 58
    const/4 v3, 0x2

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/taomee/pwdlogin/service/LoginRecordObject;->setPwd(Ljava/lang/String;)V

    .line 59
    const/4 v3, 0x3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/taomee/pwdlogin/service/LoginRecordObject;->setIsRemember(Ljava/lang/String;)V

    goto :goto_0
.end method
