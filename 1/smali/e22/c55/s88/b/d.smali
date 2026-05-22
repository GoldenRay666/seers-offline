.class Le22/c55/s88/b/d;
.super Ljava/lang/Object;


# static fields
.field private static final a:Ljava/lang/String;

.field private static final b:Ljava/lang/String;


# instance fields
.field private c:Le22/c55/s88/b/e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "s\u00c0\u0081\u0096\u00a0\u009c\u00b2x\u0086\u00b6\u00c1e"

    invoke-static {v0}, Le22/c55/s88/f/f;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le22/c55/s88/b/d;->a:Ljava/lang/String;

    const-string v0, "s\u00c0\u0081\u0096\u00a0\u009c\u00b2x\u0086\u00b6\u00c1e"

    invoke-static {v0}, Le22/c55/s88/f/f;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le22/c55/s88/b/d;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Le22/c55/s88/b/e;

    invoke-direct {v0, p1}, Le22/c55/s88/b/e;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/b/d;->c:Le22/c55/s88/b/e;

    return-void
.end method

.method static synthetic b()Ljava/lang/String;
    .locals 1

    sget-object v0, Le22/c55/s88/b/d;->a:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic c()Ljava/lang/String;
    .locals 1

    sget-object v0, Le22/c55/s88/b/d;->b:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public a()Ljava/util/List;
    .locals 9

    const/4 v2, 0x0

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Le22/c55/s88/b/d;->c:Le22/c55/s88/b/e;

    invoke-virtual {v0}, Le22/c55/s88/b/e;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    sget-object v1, Le22/c55/s88/b/d;->b:Ljava/lang/String;

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Le22/c55/s88/b/c;

    invoke-direct {v2}, Le22/c55/s88/b/c;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->aS:Ljava/lang/String;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Le22/c55/s88/b/c;->a:Ljava/lang/String;

    sget-object v3, Le22/c55/s88/f/e;->aT:Ljava/lang/String;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Le22/c55/s88/b/c;->b:Ljava/lang/String;

    sget-object v3, Le22/c55/s88/f/e;->aU:Ljava/lang/String;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v2, Le22/c55/s88/b/c;->c:I

    sget-object v3, Le22/c55/s88/f/e;->aV:Ljava/lang/String;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v2, Le22/c55/s88/b/c;->d:I

    sget-object v3, Le22/c55/s88/f/e;->aW:Ljava/lang/String;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v2, Le22/c55/s88/b/c;->e:I

    sget-object v3, Le22/c55/s88/f/e;->aY:Ljava/lang/String;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Le22/c55/s88/b/c;->f:Ljava/lang/String;

    sget-object v3, Le22/c55/s88/f/e;->aX:Ljava/lang/String;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Le22/c55/s88/b/c;->g:Ljava/lang/String;

    sget-object v3, Le22/c55/s88/f/e;->aZ:Ljava/lang/String;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    iput v3, v2, Le22/c55/s88/b/c;->h:I

    sget-object v3, Le22/c55/s88/f/e;->ba:Ljava/lang/String;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Le22/c55/s88/b/c;->i:Ljava/lang/String;

    sget-object v3, Le22/c55/s88/f/e;->bb:Ljava/lang/String;

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    iput-wide v3, v2, Le22/c55/s88/b/c;->j:J

    invoke-interface {v8, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    return-object v8
.end method

.method public declared-synchronized a(Le22/c55/s88/b/c;)V
    .locals 5

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Le22/c55/s88/b/d;->c:Le22/c55/s88/b/e;

    invoke-virtual {v0}, Le22/c55/s88/b/e;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->aS:Ljava/lang/String;

    iget-object v3, p1, Le22/c55/s88/b/c;->a:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Le22/c55/s88/f/e;->aT:Ljava/lang/String;

    iget-object v3, p1, Le22/c55/s88/b/c;->b:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Le22/c55/s88/f/e;->aU:Ljava/lang/String;

    iget v3, p1, Le22/c55/s88/b/c;->c:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v2, Le22/c55/s88/f/e;->aV:Ljava/lang/String;

    iget v3, p1, Le22/c55/s88/b/c;->d:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v2, Le22/c55/s88/f/e;->aW:Ljava/lang/String;

    iget v3, p1, Le22/c55/s88/b/c;->e:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v2, Le22/c55/s88/f/e;->aY:Ljava/lang/String;

    iget-object v3, p1, Le22/c55/s88/b/c;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Le22/c55/s88/f/e;->aX:Ljava/lang/String;

    iget-object v3, p1, Le22/c55/s88/b/c;->g:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Le22/c55/s88/f/e;->aZ:Ljava/lang/String;

    iget v3, p1, Le22/c55/s88/b/c;->h:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v2, Le22/c55/s88/f/e;->ba:Ljava/lang/String;

    iget-object v3, p1, Le22/c55/s88/b/c;->i:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Le22/c55/s88/f/e;->bb:Ljava/lang/String;

    iget-wide v3, p1, Le22/c55/s88/b/c;->j:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    sget-object v2, Le22/c55/s88/b/d;->b:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public b(Le22/c55/s88/b/c;)V
    .locals 6

    iget-object v0, p0, Le22/c55/s88/b/d;->c:Le22/c55/s88/b/e;

    invoke-virtual {v0}, Le22/c55/s88/b/e;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    sget-object v1, Le22/c55/s88/b/d;->b:Ljava/lang/String;

    sget-object v2, Le22/c55/s88/f/e;->bt:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v5, p1, Le22/c55/s88/b/c;->a:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p1, Le22/c55/s88/b/c;->b:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    return-void
.end method

.method public declared-synchronized c(Le22/c55/s88/b/c;)V
    .locals 7

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Le22/c55/s88/b/d;->c:Le22/c55/s88/b/e;

    invoke-virtual {v0}, Le22/c55/s88/b/e;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->aS:Ljava/lang/String;

    iget-object v3, p1, Le22/c55/s88/b/c;->a:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Le22/c55/s88/f/e;->aT:Ljava/lang/String;

    iget-object v3, p1, Le22/c55/s88/b/c;->b:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Le22/c55/s88/f/e;->aU:Ljava/lang/String;

    iget v3, p1, Le22/c55/s88/b/c;->c:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v2, Le22/c55/s88/f/e;->aV:Ljava/lang/String;

    iget v3, p1, Le22/c55/s88/b/c;->d:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v2, Le22/c55/s88/f/e;->aW:Ljava/lang/String;

    iget v3, p1, Le22/c55/s88/b/c;->e:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v2, Le22/c55/s88/f/e;->aY:Ljava/lang/String;

    iget-object v3, p1, Le22/c55/s88/b/c;->f:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Le22/c55/s88/f/e;->aX:Ljava/lang/String;

    iget-object v3, p1, Le22/c55/s88/b/c;->g:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Le22/c55/s88/f/e;->aZ:Ljava/lang/String;

    iget v3, p1, Le22/c55/s88/b/c;->h:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    sget-object v2, Le22/c55/s88/f/e;->ba:Ljava/lang/String;

    iget-object v3, p1, Le22/c55/s88/b/c;->i:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Le22/c55/s88/f/e;->bb:Ljava/lang/String;

    iget-wide v3, p1, Le22/c55/s88/b/c;->j:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    sget-object v2, Le22/c55/s88/b/d;->b:Ljava/lang/String;

    sget-object v3, Le22/c55/s88/f/e;->bt:Ljava/lang/String;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v6, p1, Le22/c55/s88/b/c;->a:Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    iget-object v6, p1, Le22/c55/s88/b/c;->b:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
