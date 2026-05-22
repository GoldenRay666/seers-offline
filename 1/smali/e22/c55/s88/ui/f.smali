.class Le22/c55/s88/ui/f;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Le22/c55/s88/ui/d;


# direct methods
.method constructor <init>(Le22/c55/s88/ui/d;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/ui/f;->a:Le22/c55/s88/ui/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/ui/f;->a:Le22/c55/s88/ui/d;

    invoke-static {v0}, Le22/c55/s88/ui/d;->a(Le22/c55/s88/ui/d;)I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f733333    # 0.95f

    mul-float/2addr v0, v1

    iget-object v1, p0, Le22/c55/s88/ui/f;->a:Le22/c55/s88/ui/d;

    invoke-static {v1}, Le22/c55/s88/ui/d;->b(Le22/c55/s88/ui/d;)Le22/c55/s88/ui/a;

    move-result-object v1

    iget-object v1, v1, Le22/c55/s88/ui/a;->b:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v0, v1

    float-to-int v0, v0

    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    iget-object v2, p0, Le22/c55/s88/ui/f;->a:Le22/c55/s88/ui/d;

    invoke-static {v2}, Le22/c55/s88/ui/d;->e(Le22/c55/s88/ui/d;)I

    move-result v2

    if-le v0, v2, :cond_0

    const/4 v0, 0x1

    iput v0, v1, Landroid/os/Message;->what:I

    iget-object v0, p0, Le22/c55/s88/ui/f;->a:Le22/c55/s88/ui/d;

    invoke-static {v0}, Le22/c55/s88/ui/d;->f(Le22/c55/s88/ui/d;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    iget-object v0, p0, Le22/c55/s88/ui/f;->a:Le22/c55/s88/ui/d;

    invoke-static {v0}, Le22/c55/s88/ui/d;->f(Le22/c55/s88/ui/d;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x14

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_0
    return-void

    :cond_0
    const/16 v0, 0xb

    iput v0, v1, Landroid/os/Message;->what:I

    iget-object v0, p0, Le22/c55/s88/ui/f;->a:Le22/c55/s88/ui/d;

    invoke-static {v0}, Le22/c55/s88/ui/d;->f(Le22/c55/s88/ui/d;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
