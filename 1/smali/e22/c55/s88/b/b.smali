.class public Le22/c55/s88/b/b;
.super Ljava/lang/Object;


# static fields
.field private static b:Le22/c55/s88/b/b;


# instance fields
.field a:Landroid/content/Context;

.field private c:Le22/c55/s88/d/b;

.field private d:Ljava/util/LinkedList;

.field private e:Le22/c55/s88/b/d;

.field private f:Z

.field private g:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 8

    const/4 v7, 0x5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sput-object p0, Le22/c55/s88/b/b;->b:Le22/c55/s88/b/b;

    iput-object p1, p0, Le22/c55/s88/b/b;->a:Landroid/content/Context;

    new-instance v0, Le22/c55/s88/d/b;

    invoke-direct {v0}, Le22/c55/s88/d/b;-><init>()V

    iput-object v0, p0, Le22/c55/s88/b/b;->c:Le22/c55/s88/d/b;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    new-instance v0, Le22/c55/s88/b/d;

    invoke-direct {v0, p1}, Le22/c55/s88/b/d;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/b/b;->e:Le22/c55/s88/b/d;

    iget-object v0, p0, Le22/c55/s88/b/b;->e:Le22/c55/s88/b/d;

    invoke-virtual {v0}, Le22/c55/s88/b/d;->a()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/b/c;

    new-instance v2, Le22/c55/s88/b/f;

    invoke-direct {v2, p1, v0}, Le22/c55/s88/b/f;-><init>(Landroid/content/Context;Le22/c55/s88/b/c;)V

    invoke-virtual {v2}, Le22/c55/s88/b/f;->i()I

    move-result v0

    const/4 v3, 0x4

    if-eq v0, v3, :cond_0

    invoke-virtual {v2}, Le22/c55/s88/b/f;->o()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    const-string v3, ""

    invoke-virtual {v2}, Le22/c55/s88/b/f;->o()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    invoke-virtual {p0, v2}, Le22/c55/s88/b/b;->e(Le22/c55/s88/b/f;)V

    goto :goto_0

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2}, Le22/c55/s88/b/f;->d()J

    move-result-wide v5

    sub-long/2addr v3, v5

    const-wide/32 v5, -0x65813800

    cmp-long v3, v3, v5

    if-lez v3, :cond_2

    invoke-virtual {p0, v2}, Le22/c55/s88/b/b;->e(Le22/c55/s88/b/f;)V

    goto :goto_0

    :cond_2
    packed-switch v0, :pswitch_data_0

    :cond_3
    :goto_1
    invoke-virtual {p0, v2}, Le22/c55/s88/b/b;->a(Le22/c55/s88/b/f;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :pswitch_0
    invoke-virtual {v2, v7}, Le22/c55/s88/b/f;->a(I)V

    goto :goto_1

    :pswitch_1
    new-instance v0, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Le22/c55/s88/b/f;->c()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Le22/c55/s88/f/e;->bs:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {v2, v7}, Le22/c55/s88/b/f;->a(I)V

    goto :goto_1

    :cond_4
    invoke-virtual {p0, v2}, Le22/c55/s88/b/b;->e(Le22/c55/s88/b/f;)V

    goto/16 :goto_0

    :cond_5
    iget-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/b/f;

    goto :goto_2

    :cond_6
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static a()Le22/c55/s88/b/b;
    .locals 1

    sget-object v0, Le22/c55/s88/b/b;->b:Le22/c55/s88/b/b;

    return-object v0
.end method

.method public static declared-synchronized a(Landroid/content/Context;)Le22/c55/s88/b/b;
    .locals 3

    const-class v1, Le22/c55/s88/b/b;

    monitor-enter v1

    :try_start_0
    sget-object v0, Le22/c55/s88/b/b;->b:Le22/c55/s88/b/b;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v2, Le22/c55/s88/b/b;

    invoke-direct {v2, v0}, Le22/c55/s88/b/b;-><init>(Landroid/content/Context;)V

    sput-object v2, Le22/c55/s88/b/b;->b:Le22/c55/s88/b/b;

    :cond_0
    sget-object v0, Le22/c55/s88/b/b;->b:Le22/c55/s88/b/b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private h(Le22/c55/s88/b/f;)Le22/c55/s88/b/c;
    .locals 4

    new-instance v1, Le22/c55/s88/b/c;

    invoke-direct {v1}, Le22/c55/s88/b/c;-><init>()V

    invoke-virtual {p1}, Le22/c55/s88/b/f;->o()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Le22/c55/s88/b/c;->a:Ljava/lang/String;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->c()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    :goto_0
    iput-object v0, v1, Le22/c55/s88/b/c;->b:Ljava/lang/String;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->i()I

    move-result v0

    iput v0, v1, Le22/c55/s88/b/c;->e:I

    invoke-virtual {p1}, Le22/c55/s88/b/f;->j()I

    move-result v0

    iput v0, v1, Le22/c55/s88/b/c;->d:I

    invoke-virtual {p1}, Le22/c55/s88/b/f;->k()I

    move-result v0

    iput v0, v1, Le22/c55/s88/b/c;->c:I

    invoke-virtual {p1}, Le22/c55/s88/b/f;->l()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Le22/c55/s88/b/c;->f:Ljava/lang/String;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->m()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Le22/c55/s88/b/c;->g:Ljava/lang/String;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->n()I

    move-result v0

    iput v0, v1, Le22/c55/s88/b/c;->h:I

    invoke-virtual {p1}, Le22/c55/s88/b/f;->a()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Le22/c55/s88/b/c;->i:Ljava/lang/String;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->d()J

    move-result-wide v2

    iput-wide v2, v1, Le22/c55/s88/b/c;->j:J

    return-object v1

    :cond_0
    invoke-virtual {p1}, Le22/c55/s88/b/f;->c()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public a(Le22/c55/s88/b/f;)Z
    .locals 1

    iget-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public b(Le22/c55/s88/b/f;)Le22/c55/s88/b/f;
    .locals 4

    iget-object v2, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    monitor-enter v2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    :try_start_0
    iget-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-ge v1, v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/b/f;

    invoke-virtual {v0, p1}, Le22/c55/s88/b/f;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    monitor-exit v2

    :goto_1
    return-object v0

    :cond_0
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    monitor-exit v2

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public b()Z
    .locals 1

    iget-boolean v0, p0, Le22/c55/s88/b/b;->f:Z

    return v0
.end method

.method c(Le22/c55/s88/b/f;)V
    .locals 3

    iget-object v1, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Le22/c55/s88/b/b;->e:Le22/c55/s88/b/d;

    invoke-direct {p0, p1}, Le22/c55/s88/b/b;->h(Le22/c55/s88/b/f;)Le22/c55/s88/b/c;

    move-result-object v2

    invoke-virtual {v0, v2}, Le22/c55/s88/b/d;->a(Le22/c55/s88/b/c;)V

    iget-object v0, p0, Le22/c55/s88/b/b;->c:Le22/c55/s88/d/b;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->b()Le22/c55/s88/d/e;

    move-result-object v2

    invoke-virtual {v0, v2}, Le22/c55/s88/d/b;->a(Le22/c55/s88/d/e;)V

    :goto_0
    monitor-exit v1

    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Le22/c55/s88/b/f;->a(I)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public c()Z
    .locals 1

    iget-boolean v0, p0, Le22/c55/s88/b/b;->g:Z

    return v0
.end method

.method public d()Ljava/util/List;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    return-object v0
.end method

.method public d(Le22/c55/s88/b/f;)V
    .locals 3

    iget-object v1, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/b/b;->e:Le22/c55/s88/b/d;

    invoke-direct {p0, p1}, Le22/c55/s88/b/b;->h(Le22/c55/s88/b/f;)Le22/c55/s88/b/c;

    move-result-object v2

    invoke-virtual {v0, v2}, Le22/c55/s88/b/d;->b(Le22/c55/s88/b/c;)V

    invoke-virtual {p1}, Le22/c55/s88/b/f;->b()Le22/c55/s88/d/e;

    move-result-object v0

    invoke-virtual {v0}, Le22/c55/s88/d/e;->b()V

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public e(Le22/c55/s88/b/f;)V
    .locals 3

    iget-object v1, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Le22/c55/s88/b/b;->e:Le22/c55/s88/b/d;

    invoke-direct {p0, p1}, Le22/c55/s88/b/b;->h(Le22/c55/s88/b/f;)Le22/c55/s88/b/c;

    move-result-object v2

    invoke-virtual {v0, v2}, Le22/c55/s88/b/d;->b(Le22/c55/s88/b/c;)V

    invoke-virtual {p1}, Le22/c55/s88/b/f;->b()Le22/c55/s88/d/e;

    move-result-object v0

    invoke-virtual {v0}, Le22/c55/s88/d/e;->b()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method f(Le22/c55/s88/b/f;)V
    .locals 3

    iget-object v1, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Le22/c55/s88/b/f;->b()Le22/c55/s88/d/e;

    move-result-object v0

    invoke-virtual {v0}, Le22/c55/s88/d/e;->e()V

    iget-object v0, p0, Le22/c55/s88/b/b;->c:Le22/c55/s88/d/b;

    invoke-virtual {p1}, Le22/c55/s88/b/f;->b()Le22/c55/s88/d/e;

    move-result-object v2

    invoke-virtual {v0, v2}, Le22/c55/s88/d/b;->a(Le22/c55/s88/d/e;)V

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public g(Le22/c55/s88/b/f;)V
    .locals 3

    iget-object v1, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Le22/c55/s88/b/b;->d:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/b/b;->e:Le22/c55/s88/b/d;

    invoke-direct {p0, p1}, Le22/c55/s88/b/b;->h(Le22/c55/s88/b/f;)Le22/c55/s88/b/c;

    move-result-object v2

    invoke-virtual {v0, v2}, Le22/c55/s88/b/d;->c(Le22/c55/s88/b/c;)V

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
