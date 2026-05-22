.class Le22/c55/s88/ui/g;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Le22/c55/s88/ui/d;


# direct methods
.method constructor <init>(Le22/c55/s88/ui/d;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/ui/g;->a:Le22/c55/s88/ui/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Le22/c55/s88/ui/g;->a:Le22/c55/s88/ui/d;

    invoke-static {v0}, Le22/c55/s88/ui/d;->b(Le22/c55/s88/ui/d;)Le22/c55/s88/ui/a;

    move-result-object v0

    iget-object v0, v0, Le22/c55/s88/ui/a;->b:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x0

    new-instance v1, Landroid/os/Message;

    invoke-direct {v1}, Landroid/os/Message;-><init>()V

    iget-object v2, p0, Le22/c55/s88/ui/g;->a:Le22/c55/s88/ui/d;

    invoke-static {v2}, Le22/c55/s88/ui/d;->g(Le22/c55/s88/ui/d;)I

    move-result v2

    if-le v0, v2, :cond_0

    const/4 v0, 0x0

    iput v0, v1, Landroid/os/Message;->what:I

    iget-object v0, p0, Le22/c55/s88/ui/g;->a:Le22/c55/s88/ui/d;

    iget-object v2, p0, Le22/c55/s88/ui/g;->a:Le22/c55/s88/ui/d;

    invoke-static {v2}, Le22/c55/s88/ui/d;->d(Le22/c55/s88/ui/d;)I

    move-result v2

    iget-object v3, p0, Le22/c55/s88/ui/g;->a:Le22/c55/s88/ui/d;

    invoke-static {v3}, Le22/c55/s88/ui/d;->g(Le22/c55/s88/ui/d;)I

    move-result v3

    add-int/2addr v2, v3

    invoke-static {v0, v2}, Le22/c55/s88/ui/d;->a(Le22/c55/s88/ui/d;I)I

    iget-object v0, p0, Le22/c55/s88/ui/g;->a:Le22/c55/s88/ui/d;

    const/4 v2, 0x2

    invoke-static {v0, v2}, Le22/c55/s88/ui/d;->b(Le22/c55/s88/ui/d;I)I

    iget-object v0, p0, Le22/c55/s88/ui/g;->a:Le22/c55/s88/ui/d;

    invoke-static {v0}, Le22/c55/s88/ui/d;->f(Le22/c55/s88/ui/d;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    iget-object v0, p0, Le22/c55/s88/ui/g;->a:Le22/c55/s88/ui/d;

    invoke-static {v0}, Le22/c55/s88/ui/d;->f(Le22/c55/s88/ui/d;)Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x14

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_0
    return-void

    :cond_0
    const/16 v0, 0xa

    iput v0, v1, Landroid/os/Message;->what:I

    iget-object v0, p0, Le22/c55/s88/ui/g;->a:Le22/c55/s88/ui/d;

    invoke-static {v0}, Le22/c55/s88/ui/d;->f(Le22/c55/s88/ui/d;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0
.end method
