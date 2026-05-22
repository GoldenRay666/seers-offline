.class Lcom/taomee/seer2/n/ac;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:[Lcom/taomee/seer2/n/w;

.field final synthetic b:Lcom/taomee/seer2/n/ab;


# direct methods
.method constructor <init>(Lcom/taomee/seer2/n/ab;[Lcom/taomee/seer2/n/w;)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/n/ac;->b:Lcom/taomee/seer2/n/ab;

    iput-object p2, p0, Lcom/taomee/seer2/n/ac;->a:[Lcom/taomee/seer2/n/w;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/taomee/seer2/n/ac;->b:Lcom/taomee/seer2/n/ab;

    iget-object v0, v0, Lcom/taomee/seer2/n/ab;->b:Lcom/taomee/seer2/n/aa;

    invoke-static {v0}, Lcom/taomee/seer2/n/aa;->b(Lcom/taomee/seer2/n/aa;)Lcom/taomee/seer2/n/ad;

    move-result-object v0

    iget-object v1, p0, Lcom/taomee/seer2/n/ac;->a:[Lcom/taomee/seer2/n/w;

    invoke-interface {v0, v1}, Lcom/taomee/seer2/n/ad;->a([Lcom/taomee/seer2/n/w;)V

    return-void
.end method
