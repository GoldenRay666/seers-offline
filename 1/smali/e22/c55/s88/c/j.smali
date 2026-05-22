.class Le22/c55/s88/c/j;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Le22/c55/s88/e/j;

.field final synthetic b:Le22/c55/s88/c/i;


# direct methods
.method constructor <init>(Le22/c55/s88/c/i;Le22/c55/s88/e/j;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/c/j;->b:Le22/c55/s88/c/i;

    iput-object p2, p0, Le22/c55/s88/c/j;->a:Le22/c55/s88/e/j;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/c/j;->b:Le22/c55/s88/c/i;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Le22/c55/s88/c/i;->a(Le22/c55/s88/c/i;Z)Z

    iget-object v0, p0, Le22/c55/s88/c/j;->b:Le22/c55/s88/c/i;

    invoke-static {v0}, Le22/c55/s88/c/i;->a(Le22/c55/s88/c/i;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Le22/c55/s88/c/c;->a(Landroid/content/Context;)Le22/c55/s88/c/c;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/c/j;->a:Le22/c55/s88/e/j;

    iget v2, v2, Le22/c55/s88/e/j;->h:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Le22/c55/s88/c/j;->b:Le22/c55/s88/c/i;

    invoke-static {v2}, Le22/c55/s88/c/i;->a(Le22/c55/s88/c/i;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le22/c55/s88/f/a;->r(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Le22/c55/s88/c/c;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v1

    if-eqz v1, :cond_3

    const-class v0, Le22/c55/s88/c/h;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/c/h;

    if-eqz v0, :cond_2

    iget v0, v0, Le22/c55/s88/c/h;->a:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/c/j;->b:Le22/c55/s88/c/i;

    invoke-static {v0}, Le22/c55/s88/c/i;->a(Le22/c55/s88/c/i;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Le22/c55/s88/f/a;->h(Landroid/content/Context;Ljava/lang/String;)V

    :cond_0
    :goto_0
    const-class v0, Le22/c55/s88/c/e;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Le22/c55/s88/c/e;

    check-cast v0, [Le22/c55/s88/c/e;

    if-eqz v0, :cond_1

    iget-object v1, p0, Le22/c55/s88/c/j;->b:Le22/c55/s88/c/i;

    invoke-static {v1}, Le22/c55/s88/c/i;->b(Le22/c55/s88/c/i;)Le22/c55/s88/c/l;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Le22/c55/s88/c/j;->b:Le22/c55/s88/c/i;

    invoke-static {v1}, Le22/c55/s88/c/i;->c(Le22/c55/s88/c/i;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Le22/c55/s88/c/k;

    invoke-direct {v2, p0, v0}, Le22/c55/s88/c/k;-><init>(Le22/c55/s88/c/j;[Le22/c55/s88/c/e;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    :goto_1
    const-wide/16 v0, 0xc8

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    iget-object v0, p0, Le22/c55/s88/c/j;->b:Le22/c55/s88/c/i;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Le22/c55/s88/c/i;->a(Le22/c55/s88/c/i;Z)Z

    return-void

    :cond_2
    iget-object v0, p0, Le22/c55/s88/c/j;->b:Le22/c55/s88/c/i;

    invoke-static {v0}, Le22/c55/s88/c/i;->a(Le22/c55/s88/c/i;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Le22/c55/s88/f/a;->h(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Le22/c55/s88/c/j;->b:Le22/c55/s88/c/i;

    invoke-static {v0}, Le22/c55/s88/c/i;->a(Le22/c55/s88/c/i;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v2}, Le22/c55/s88/f/a;->h(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2
.end method
