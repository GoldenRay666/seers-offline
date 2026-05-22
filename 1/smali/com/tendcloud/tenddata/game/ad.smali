.class final Lcom/tendcloud/tenddata/game/ad;
.super Landroid/database/sqlite/SQLiteOpenHelper;


# static fields
.field private static final a:Ljava/lang/String; = "TDGAtcagentgame.db"

.field private static final b:I = 0x1


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 3

    const-string v0, "TDGAtcagentgame.db"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 6

    const/4 v5, 0x2

    const/4 v4, 0x0

    const/4 v3, 0x1

    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "DatabaseUtils"

    aput-object v1, v0, v4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Creating database "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "DatabaseUtils"

    aput-object v1, v0, v4

    const-string v1, "Database Not Open"

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->setLockingEnabled(Z)V

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v0, "CREATE TABLE normal_event (_id INTEGER PRIMARY KEY autoincrement,event_data TEXT)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v0, "CREATE TABLE exception_event (_id INTEGER PRIMARY KEY autoincrement,event_data TEXT,event_hash_key TEXT)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    const-wide/32 v0, 0x100000

    invoke-virtual {p1, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->setMaximumSize(J)J

    goto :goto_0
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    return-void
.end method
