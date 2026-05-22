.class Le22/c55/s88/e/c;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Le22/c55/s88/e/b;


# direct methods
.method constructor <init>(Le22/c55/s88/e/b;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/e/c;->a:Le22/c55/s88/e/b;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 10

    const/4 v2, 0x0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v1, p0, Le22/c55/s88/e/c;->a:Le22/c55/s88/e/b;

    invoke-static {v1}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/b;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le22/c55/s88/b/b;->a(Landroid/content/Context;)Le22/c55/s88/b/b;

    check-cast v0, Le22/c55/s88/e/j;

    new-instance v1, Le22/c55/s88/e/d;

    invoke-direct {v1, p0, v0}, Le22/c55/s88/e/d;-><init>(Le22/c55/s88/e/c;Le22/c55/s88/e/j;)V

    new-instance v3, Le22/c55/s88/b/f;

    iget-object v4, v0, Le22/c55/s88/e/j;->q:Ljava/lang/String;

    iget-object v5, p0, Le22/c55/s88/e/c;->a:Le22/c55/s88/e/b;

    invoke-static {v5}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/b;)Landroid/content/Context;

    move-result-object v5

    sget-object v6, Le22/c55/s88/f/e;->w:Ljava/lang/String;

    iget v7, v0, Le22/c55/s88/e/j;->h:I

    invoke-static {v5, v6, v7}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v5

    invoke-direct {v3, v4, v5, v2}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    iget-object v4, p0, Le22/c55/s88/e/c;->a:Le22/c55/s88/e/b;

    invoke-static {v4}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/b;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v3, v1}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    iget-object v1, v0, Le22/c55/s88/e/j;->r:Ljava/lang/String;

    const-string v3, ";"

    invoke-static {v1, v3}, Le22/c55/s88/f/a;->a(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    array-length v1, v4

    :goto_0
    move v3, v2

    :goto_1
    if-ge v3, v1, :cond_0

    new-instance v5, Le22/c55/s88/b/f;

    aget-object v6, v4, v3

    iget-object v7, p0, Le22/c55/s88/e/c;->a:Le22/c55/s88/e/b;

    invoke-static {v7}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/b;)Landroid/content/Context;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Le22/c55/s88/f/e;->x:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iget v9, v0, Le22/c55/s88/e/j;->h:I

    invoke-static {v7, v8, v9}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v7

    invoke-direct {v5, v6, v7, v2}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    iget-object v6, p0, Le22/c55/s88/e/c;->a:Le22/c55/s88/e/b;

    invoke-static {v6}, Le22/c55/s88/e/b;->a(Le22/c55/s88/e/b;)Landroid/content/Context;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v5, v7}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_0
    return-void

    :cond_1
    move v1, v2

    goto :goto_0
.end method
