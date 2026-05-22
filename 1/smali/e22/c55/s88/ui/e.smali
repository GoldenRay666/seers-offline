.class Le22/c55/s88/ui/e;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Le22/c55/s88/ui/d;


# direct methods
.method constructor <init>(Le22/c55/s88/ui/d;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    const/4 v5, 0x2

    const/4 v4, 0x1

    iget-object v1, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Le22/c55/s88/ui/d;->a(Le22/c55/s88/ui/d;Z)Z

    iget-object v0, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    invoke-static {v0}, Le22/c55/s88/ui/d;->a(Le22/c55/s88/ui/d;)I

    move-result v0

    int-to-float v0, v0

    const v2, 0x3f733333    # 0.95f

    mul-float/2addr v0, v2

    const/high16 v2, 0x40a00000    # 5.0f

    div-float/2addr v0, v2

    float-to-int v0, v0

    iget-object v2, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    invoke-static {v2}, Le22/c55/s88/ui/d;->b(Le22/c55/s88/ui/d;)Le22/c55/s88/ui/a;

    move-result-object v2

    invoke-virtual {v2}, Le22/c55/s88/ui/a;->a()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    iget v3, p1, Landroid/os/Message;->what:I

    if-ne v3, v4, :cond_0

    iget-object v3, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    sub-int v4, v0, v2

    invoke-virtual {v3, v4}, Le22/c55/s88/ui/d;->a(I)V

    :cond_0
    iget v3, p1, Landroid/os/Message;->what:I

    const/16 v4, 0xb

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Le22/c55/s88/ui/d;->a(Le22/c55/s88/ui/d;Z)Z

    iget-object v3, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Le22/c55/s88/ui/d;->a(Z)V

    :cond_1
    iget v3, p1, Landroid/os/Message;->what:I

    if-ne v3, v5, :cond_2

    iget-object v3, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    mul-int/lit8 v0, v0, -0x1

    add-int/2addr v0, v2

    invoke-virtual {v3, v0}, Le22/c55/s88/ui/d;->a(I)V

    :cond_2
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_3

    iget-object v0, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    invoke-static {v0}, Le22/c55/s88/ui/d;->c(Le22/c55/s88/ui/d;)I

    move-result v0

    if-ne v0, v5, :cond_5

    iget-object v0, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    iget-object v2, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    invoke-static {v2}, Le22/c55/s88/ui/d;->d(Le22/c55/s88/ui/d;)I

    move-result v2

    mul-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Le22/c55/s88/ui/d;->a(I)V

    :cond_3
    :goto_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v2, 0xa

    if-ne v0, v2, :cond_4

    iget-object v0, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Le22/c55/s88/ui/d;->a(Le22/c55/s88/ui/d;Z)Z

    iget-object v0, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Le22/c55/s88/ui/d;->a(ZI)V

    :cond_4
    monitor-exit v1

    return-void

    :cond_5
    iget-object v0, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    iget-object v2, p0, Le22/c55/s88/ui/e;->a:Le22/c55/s88/ui/d;

    invoke-static {v2}, Le22/c55/s88/ui/d;->d(Le22/c55/s88/ui/d;)I

    move-result v2

    invoke-virtual {v0, v2}, Le22/c55/s88/ui/d;->a(I)V

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
