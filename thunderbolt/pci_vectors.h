/* this is backported patch from
 * https://github.com/torvalds/linux/commit/aff171641d181ea573380efc3f559c9de4741fc5
 * and
 * https://github.com/torvalds/linux/commit/4fe0d154880bb6eb833cbe84fa6f385f400f0b9c
 * only use it when on 4.8 or less
 */

#define PCI_IRQ_LEGACY         (1 << 0) /* allow legacy interrupts */
#define PCI_IRQ_MSI            (1 << 1) /* allow MSI interrupts */
#define PCI_IRQ_MSIX           (1 << 2) /* allow MSI-X interrupts */
#define PCI_IRQ_AFFINITY       (1 << 3) /* auto-assign affinity */
#define PCI_IRQ_ALL_TYPES \
       (PCI_IRQ_LEGACY | PCI_IRQ_MSI | PCI_IRQ_MSIX)
static inline int pci_alloc_irq_vectors(struct pci_dev *dev,
		unsigned int min_vecs, unsigned int max_vecs,
		unsigned int flags)
{
	if (min_vecs > 1)
		return -EINVAL;
	return 1;
}
static inline void pci_free_irq_vectors(struct pci_dev *dev)
{
}

static inline int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
{
	if (WARN_ON_ONCE(nr > 0))
		return -EINVAL;
	return dev->irq;
}

