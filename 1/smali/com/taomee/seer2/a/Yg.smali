.class public Lcom/taomee/seer2/a/Yg;
.super Landroid/app/Service;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Lcom/taomee/seer2/a/b/a;

.field private c:Lcom/taomee/seer2/a/c;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/taomee/seer2/a/Yg;->a:Landroid/content/Context;

    new-instance v0, Lcom/taomee/seer2/a/c;

    invoke-direct {v0, p0}, Lcom/taomee/seer2/a/c;-><init>(Lcom/taomee/seer2/a/Yg;)V

    iput-object v0, p0, Lcom/taomee/seer2/a/Yg;->c:Lcom/taomee/seer2/a/c;

    return-void
.end method

.method static synthetic a(Lcom/taomee/seer2/a/Yg;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/a/Yg;->a:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic a(Lcom/taomee/seer2/a/Yg;Landroid/content/Context;)Landroid/content/Context;
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/a/Yg;->a:Landroid/content/Context;

    return-object p1
.end method

.method static synthetic a(Lcom/taomee/seer2/a/Yg;Lcom/taomee/seer2/a/b/a;)Lcom/taomee/seer2/a/b/a;
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/a/Yg;->b:Lcom/taomee/seer2/a/b/a;

    return-object p1
.end method

.method static synthetic b(Lcom/taomee/seer2/a/Yg;)Lcom/taomee/seer2/a/b/a;
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/a/Yg;->b:Lcom/taomee/seer2/a/b/a;

    return-object v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 1

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    iget-object v0, p0, Lcom/taomee/seer2/a/Yg;->c:Lcom/taomee/seer2/a/c;

    invoke-virtual {v0}, Lcom/taomee/seer2/a/c;->a()V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    iget-object v0, p0, Lcom/taomee/seer2/a/Yg;->c:Lcom/taomee/seer2/a/c;

    invoke-virtual {v0}, Lcom/taomee/seer2/a/c;->b()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/a/Yg;->c:Lcom/taomee/seer2/a/c;

    invoke-virtual {v0, p1, p2, p3}, Lcom/taomee/seer2/a/c;->a(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method
