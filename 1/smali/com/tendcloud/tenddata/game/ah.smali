.class public final Lcom/tendcloud/tenddata/game/ah;
.super Ljava/lang/Object;


# static fields
.field static final a:I = 0x64

.field static final b:I = 0xa

.field static c:Lcom/tendcloud/tenddata/game/ad; = null

.field static final d:Ljava/lang/String; = "_id"

.field static final e:Ljava/lang/String; = "event_data"

.field static final f:Ljava/lang/String; = "event_hash_key"

.field static final g:Ljava/lang/String; = "normal_event"

.field static final h:Ljava/lang/String; = "exception_event"

.field static final i:Ljava/lang/String; = "CREATE TABLE normal_event (_id INTEGER PRIMARY KEY autoincrement,event_data TEXT)"

.field static final j:Ljava/lang/String; = "CREATE TABLE exception_event (_id INTEGER PRIMARY KEY autoincrement,event_data TEXT,event_hash_key TEXT)"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tendcloud/tenddata/game/ad;

    sget-object v1, Lcom/tendcloud/tenddata/TalkingDataGA;->a:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/tendcloud/tenddata/game/ad;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/tendcloud/tenddata/game/ah;->c:Lcom/tendcloud/tenddata/game/ad;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized a()Ljava/util/List;
    .locals 2

    const-class v1, Lcom/tendcloud/tenddata/game/ah;

    monitor-enter v1

    :try_start_0
    new-instance v0, Lcom/tendcloud/tenddata/game/e;

    invoke-direct {v0}, Lcom/tendcloud/tenddata/game/e;-><init>()V

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/ah;->b(Lcom/tendcloud/tenddata/game/a;)V

    invoke-virtual {v0}, Lcom/tendcloud/tenddata/game/e;->a()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static a(Lcom/tendcloud/tenddata/game/a;)V
    .locals 1

    sget-object v0, Lcom/tendcloud/tenddata/game/ah;->c:Lcom/tendcloud/tenddata/game/ad;

    invoke-virtual {v0}, Lcom/tendcloud/tenddata/game/ad;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    invoke-virtual {p0, v0}, Lcom/tendcloud/tenddata/game/a;->a(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {p0}, Lcom/tendcloud/tenddata/game/a;->run()V

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    return-void
.end method

.method public static declared-synchronized a(Lcom/tendcloud/tenddata/game/aq;)V
    .locals 5

    const-class v1, Lcom/tendcloud/tenddata/game/ah;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Lcom/tendcloud/tenddata/game/aq;->d()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "Save event data:"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/at;->a([Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    :goto_0
    monitor-exit v1

    return-void

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/tendcloud/tenddata/game/aq;->c()Z

    move-result v2

    if-nez v2, :cond_1

    new-instance v2, Lcom/tendcloud/tenddata/game/m;

    invoke-direct {v2, v0}, Lcom/tendcloud/tenddata/game/m;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/ah;->a(Lcom/tendcloud/tenddata/game/a;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_1
    :try_start_2
    check-cast p0, Lcom/tendcloud/tenddata/game/af;

    new-instance v2, Lcom/tendcloud/tenddata/game/aj;

    invoke-interface {p0}, Lcom/tendcloud/tenddata/game/af;->b()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lcom/tendcloud/tenddata/game/aj;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2}, Lcom/tendcloud/tenddata/game/ah;->a(Lcom/tendcloud/tenddata/game/a;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method static declared-synchronized a(Ljava/util/List;)V
    .locals 2

    const-class v1, Lcom/tendcloud/tenddata/game/ah;

    monitor-enter v1

    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p0}, Ljava/util/List;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    monitor-exit v1

    return-void

    :cond_1
    :try_start_1
    new-instance v0, Lcom/tendcloud/tenddata/game/ao;

    invoke-direct {v0, p0}, Lcom/tendcloud/tenddata/game/ao;-><init>(Ljava/util/List;)V

    invoke-static {v0}, Lcom/tendcloud/tenddata/game/ah;->a(Lcom/tendcloud/tenddata/game/a;)V

    invoke-interface {p0}, Ljava/util/List;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static b(Lcom/tendcloud/tenddata/game/a;)V
    .locals 1

    sget-object v0, Lcom/tendcloud/tenddata/game/ah;->c:Lcom/tendcloud/tenddata/game/ad;

    invoke-virtual {v0}, Lcom/tendcloud/tenddata/game/ad;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/tendcloud/tenddata/game/a;->a(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {p0}, Lcom/tendcloud/tenddata/game/a;->run()V

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    return-void
.end method
