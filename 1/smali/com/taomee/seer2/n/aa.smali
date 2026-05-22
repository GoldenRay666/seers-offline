.class public Lcom/taomee/seer2/n/aa;
.super Ljava/lang/Object;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Landroid/os/Handler;

.field private c:Z

.field private d:Lcom/taomee/seer2/n/ad;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/taomee/seer2/n/aa;->b:Landroid/os/Handler;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/taomee/seer2/n/aa;->c:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/taomee/seer2/n/aa;->d:Lcom/taomee/seer2/n/ad;

    iput-object p1, p0, Lcom/taomee/seer2/n/aa;->a:Landroid/content/Context;

    return-void
.end method

.method static synthetic a(Lcom/taomee/seer2/n/aa;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/n/aa;->a:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic a(Lcom/taomee/seer2/n/aa;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/taomee/seer2/n/aa;->c:Z

    return p1
.end method

.method static synthetic b(Lcom/taomee/seer2/n/aa;)Lcom/taomee/seer2/n/ad;
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/n/aa;->d:Lcom/taomee/seer2/n/ad;

    return-object v0
.end method

.method static synthetic c(Lcom/taomee/seer2/n/aa;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/n/aa;->b:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public a(Lcom/taomee/seer2/n/ad;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/n/aa;->d:Lcom/taomee/seer2/n/ad;

    return-void
.end method

.method public a(Lcom/taomee/seer2/n/am;)V
    .locals 1

    new-instance v0, Lcom/taomee/seer2/n/ab;

    invoke-direct {v0, p0, p1}, Lcom/taomee/seer2/n/ab;-><init>(Lcom/taomee/seer2/n/aa;Lcom/taomee/seer2/n/am;)V

    invoke-virtual {v0}, Lcom/taomee/seer2/n/ab;->start()V

    return-void
.end method

.method public a()Z
    .locals 1

    iget-boolean v0, p0, Lcom/taomee/seer2/n/aa;->c:Z

    return v0
.end method
