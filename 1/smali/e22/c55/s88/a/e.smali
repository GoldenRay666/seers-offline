.class Le22/c55/s88/a/e;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Le22/c55/s88/e/j;

.field final synthetic b:Landroid/os/Handler;

.field final synthetic c:Le22/c55/s88/a/d;


# direct methods
.method constructor <init>(Le22/c55/s88/a/d;Le22/c55/s88/e/j;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/a/e;->c:Le22/c55/s88/a/d;

    iput-object p2, p0, Le22/c55/s88/a/e;->a:Le22/c55/s88/e/j;

    iput-object p3, p0, Le22/c55/s88/a/e;->b:Landroid/os/Handler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Le22/c55/s88/a/e;->a:Le22/c55/s88/e/j;

    iget-object v1, v1, Le22/c55/s88/e/j;->q:Ljava/lang/String;

    iget-object v2, p0, Le22/c55/s88/a/e;->a:Le22/c55/s88/e/j;

    iget-object v2, v2, Le22/c55/s88/e/j;->q:Ljava/lang/String;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Le22/c55/s88/f/e;->br:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le22/c55/s88/b/f;

    iget-object v2, p0, Le22/c55/s88/a/e;->a:Le22/c55/s88/e/j;

    iget-object v2, v2, Le22/c55/s88/e/j;->q:Ljava/lang/String;

    iget-object v3, p0, Le22/c55/s88/a/e;->c:Le22/c55/s88/a/d;

    invoke-static {v3}, Le22/c55/s88/a/d;->a(Le22/c55/s88/a/d;)Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Le22/c55/s88/a/e;->a:Le22/c55/s88/e/j;

    iget v4, v4, Le22/c55/s88/e/j;->h:I

    invoke-static {v3, v0, v4}, Le22/c55/s88/f/a;->b(Landroid/content/Context;Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    const/4 v3, 0x0

    invoke-direct {v1, v2, v0, v3}, Le22/c55/s88/b/f;-><init>(Ljava/lang/String;Ljava/io/File;I)V

    iget-object v0, p0, Le22/c55/s88/a/e;->a:Le22/c55/s88/e/j;

    iget v0, v0, Le22/c55/s88/e/j;->h:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v0}, Le22/c55/s88/b/f;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Le22/c55/s88/a/e;->c:Le22/c55/s88/a/d;

    new-instance v2, Le22/c55/s88/e/a;

    iget-object v3, p0, Le22/c55/s88/a/e;->c:Le22/c55/s88/a/d;

    invoke-static {v3}, Le22/c55/s88/a/d;->a(Le22/c55/s88/a/d;)Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Le22/c55/s88/a/e;->a:Le22/c55/s88/e/j;

    iget-object v5, p0, Le22/c55/s88/a/e;->b:Landroid/os/Handler;

    invoke-direct {v2, v3, v4, v5}, Le22/c55/s88/e/a;-><init>(Landroid/content/Context;Le22/c55/s88/e/j;Landroid/os/Handler;)V

    invoke-static {v0, v2}, Le22/c55/s88/a/d;->a(Le22/c55/s88/a/d;Le22/c55/s88/e/a;)Le22/c55/s88/e/a;

    iget-object v0, p0, Le22/c55/s88/a/e;->c:Le22/c55/s88/a/d;

    invoke-static {v0}, Le22/c55/s88/a/d;->a(Le22/c55/s88/a/d;)Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Le22/c55/s88/a/e;->c:Le22/c55/s88/a/d;

    invoke-static {v2}, Le22/c55/s88/a/d;->b(Le22/c55/s88/a/d;)Le22/c55/s88/e/a;

    move-result-object v2

    invoke-static {v0, v1, v2}, Le22/c55/s88/e/g;->a(Landroid/content/Context;Le22/c55/s88/b/f;Le22/c55/s88/b/a;)V

    goto :goto_0
.end method
